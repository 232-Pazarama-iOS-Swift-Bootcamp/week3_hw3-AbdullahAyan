//
//  FavoritesViewController.swift
//  iTunes Client App
//
//  Created by Abdullah Ayan on 6.10.2022.
//

import UIKit

class FavoritesViewController: UITableViewController {

    
    static var Favorites = [Media]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorites"

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "zort"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
        }
    }

}
