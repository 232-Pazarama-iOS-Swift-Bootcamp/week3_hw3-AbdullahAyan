//
//  MainViewController.swift
//  iTunes Client App
//
//  Created by Pazarama iOS Bootcamp on 1.10.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - Properties
    private let mainView = MainView()
    private let networkService = BaseNetworkService()
    private var response: Response? {
        didSet {
            mainView.refresh()
        }
    }
    
    var media: String?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        title = tabBarItem.title
        mainView.setCollectionViewDelegate(self, andDataSource: self)
        
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Search..."
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart.circle.fill"), style: .done, target: self, action: #selector(goFavorites))
        
        media = tabBarItem.title?.lowercased()
        
        fetchMedia(with: media!)
    }
    
    // MARK: - Methods
    private func fetchMedia(with text: String) {
        networkService.request(Request(searchText: text,media: media!.lowercased() )) { result in
            switch result {
            case .success(let response):
                self.response = response
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }
    
    @objc func goFavorites() {
        let vc = FavoritesViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.media = response?.results?[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        response?.results?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        let media = response?.results?[indexPath.row]
        cell.title = media?.trackName
        if let image = media?.artworkLarge {
            cell.imageView.downloadImage(from: image)
        }else {
            cell.imageView.downloadImage(from: media?.artworkNormal)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
    }
}

// MARK: - UISearchResultsUpdating
extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 1 {
            fetchMedia(with: text)
        }
    }
}
