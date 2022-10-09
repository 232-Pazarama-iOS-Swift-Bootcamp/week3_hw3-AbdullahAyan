//
//  Database.swift
//  iTunes Client App
//
//  Created by Abdullah Ayan on 9.10.2022.
//

import Foundation
import CoreData
import UIKit

class Database {
    
    func createItem(media: Media) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Favorite", in: managedContext)!
        let item = NSManagedObject(entity: entity, insertInto: managedContext)
        
        
    }
    
}
