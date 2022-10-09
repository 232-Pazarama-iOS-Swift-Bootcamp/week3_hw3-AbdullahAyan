//
//  DetailViewController.swift
//  iTunes Client App
//
//  Created by Pazarama iOS Bootcamp on 2.10.2022.
//

import UIKit

final class DetailViewController: UIViewController {
    
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
    
    private let detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailView
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .done, target: self, action: #selector(addFavorites))
        
    }
    
    @objc func addFavorites() {
        
    }
}
