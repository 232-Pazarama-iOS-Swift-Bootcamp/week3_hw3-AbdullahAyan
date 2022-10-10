//
//  FavoritesViewController.swift
//  iTunes Client App
//
//  Created by Abdullah Ayan on 6.10.2022.
//

import UIKit

class FavoritesViewController: UITableViewController, UISearchResultsUpdating {

    var favoritesList = [DatabaseMedia]()
    var searchResult = [DatabaseMedia]()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorites"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        let db = Database()
        db.fetchItems()
        favoritesList.removeAll()
        
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Search..."
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        for item in Database.mediaList {
            favoritesList.append(item)
            searchResult.append(item)
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 1 {
            searchResult.removeAll()
            for item in favoritesList {
                if item.trackName.contains(text) {
                    searchResult.append(item)
                }
            }
        }
        if searchController.searchBar.text == "" {
            searchResult = favoritesList
        }
        tableView.reloadData()
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.count
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = searchResult[indexPath.row].trackName
        return cell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.databaseMedia = searchResult[indexPath.row]
        present(vc, animated: true)
    }

}
