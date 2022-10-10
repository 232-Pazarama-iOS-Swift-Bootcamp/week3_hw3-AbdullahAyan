//
//  DetailViewController.swift
//  iTunes Client App
//
//  Created by Pazarama iOS Bootcamp on 2.10.2022.
//

import UIKit
import CoreData

final class DetailViewController: UIViewController {
    
    let db = Database()
    
    var media: Media? {
        didSet {
            title = media?.trackName
            if (media?.artworkLarge) != nil {
                detailView.imageView.downloadImage(from: media?.artworkLarge)
            }else {
                detailView.imageView.downloadImage(from: media?.artworkNormal)
            }
            detailView.releaseDate = media?.releaseDate
            detailView.artistName = media?.artistName
            detailView.country = media?.country
            }
    }
    
    var databaseMedia: DatabaseMedia? {
        didSet {
            title = databaseMedia?.trackName
            if (databaseMedia?.artworkLarge) != nil {
                detailView.imageView.downloadImage(from: databaseMedia?.artworkLarge)
            }else {
                detailView.imageView.downloadImage(from: databaseMedia?.artworkNormal)
            }
            detailView.releaseDate = databaseMedia?.releaseDate
            detailView.artistName = databaseMedia?.artistName
            detailView.country = databaseMedia?.country
            }
    }
    
    private let detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailView
        
        var isExist = false
        
        db.fetchItems()
        
        for item in Database.mediaList {
            if item.trackName == media?.trackName {
                isExist = true
            }
        }
        
        if isExist {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .done, target: self, action: #selector(deleteFavorite))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .done, target: self, action: #selector(addFavorites))
        }
       
        
        
    }
    
    @objc func addFavorites() {
        db.createItem(media: media!)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .done, target: self, action: #selector(deleteFavorite))
        
    }
    
    @objc func deleteFavorite() {
    }
}
