//
//  Database.swift
//  iTunes Client App
//
//  Created by Abdullah Ayan on 9.10.2022.
//

import CoreData
import UIKit

class Database{
    
    static var mediaList = [DatabaseMedia]()
    
    static let appDelegate = UIApplication.shared.delegate as? AppDelegate
    static let managedContext = appDelegate!.persistentContainer.viewContext
    static let entity = NSEntityDescription.entity(forEntityName: "Favorite", in: managedContext)!
    
    var item = NSManagedObject(entity: entity, insertInto: managedContext)
    
    func createItem(media: Media) {
        item.setValue(media.trackName, forKey: "trackName")
        item.setValue(media.country, forKey: "country")
        item.setValue(media.releaseDate, forKey: "releaseDate")
        item.setValue(media.artworkLarge?.absoluteString, forKey: "artworkLarge")
        item.setValue(media.artworkNormal?.absoluteString, forKey: "artworkNormal")
        item.setValue(media.context, forKey: "context")
        item.setValue(media.artistName, forKey: "artistName")
        save()
    }
    
    func deleteItem(media: Media) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorite")
        do{
            let fetchResults = try Database.managedContext.fetch(fetchRequest)
            for item in fetchResults as! [NSManagedObject]{
                if let trackName = item.value(forKey: "trackName") as? String,
                   trackName == media.trackName {
                    Database.managedContext.delete(item)
                    break
                }
            }
        }catch let error{
                print(error.localizedDescription)
        }
        
        save()    }
    
    func save() {
        do {
            try Database.managedContext.save()
        } catch let error {
            print("Item can not be created \(error.localizedDescription)")
        }
    }
    
    func fetchItems() {
        Database.mediaList.removeAll()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorite")
        do {
            let fetchResult = try Database.managedContext.fetch(fetchRequest)
            for item in fetchResult as! [NSManagedObject]{
                if item.value(forKey: "trackName") != nil {
                    let media = DatabaseMedia()
                    media.context = item.value(forKey: "context") as? String ?? ""
                    media.country = item.value(forKey: "country") as? String ?? ""
                    media.artworkLarge = URL(string: item.value(forKey: "artworkLarge") as? String ?? "") ?? URL(string: "")
                    media.trackName = item.value(forKey: "trackName") as? String ?? ""
                    media.releaseDate = item.value(forKey: "releaseDate") as? String ?? ""
                    media.artistName = item.value(forKey: "artistName") as? String ?? ""
                    media.artworkNormal = URL(string: item.value(forKey: "artworkNormal") as? String ?? "") ?? URL(string: "")
                    Database.mediaList.append(media)
                }
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
}

