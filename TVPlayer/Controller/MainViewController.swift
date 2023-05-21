//
//  ViewController.swift
//  TVPlayer
//
//  Created by Алексей Колыченков on 18.05.2023.
//

import UIKit

class MainViewController: UIViewController {

    let collectionView = ListCollectionView()

    let searchController = UISearchController(searchResultsController: nil)


//    var favoriteChannels: [UIButton] {
//        get {
//            if let array = UserDefaults.standard.array(forKey: "favoriteChannelsKey") as? [UIButton] {
//               return array
//            } else {
//                return []
//            }
//        }
//        set {
//            UserDefaults.standard.set(newValue, forKey: "favoriteChannelsKey")
//            UserDefaults.standard.synchronize()
//        }
//    }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(collectionView)
        setupNavigationBar()
        setupSearchBar()
        setConstraints()
    }
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        definesPresentationContext = false
        searchController.searchBar.placeholder = "Напишите название телеканала"
    }
}

extension MainViewController {
    private func setConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension MainViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
    }
}
