//
//  ViewController.swift
//  TVPlayer
//
//  Created by Алексей Колыченков on 18.05.2023.
//

import UIKit

class MainViewController: UIViewController {
    var dataFetcherService = DataFetcherService()
    let collectionView = ListCollectionView()
    let searchController = UISearchController(searchResultsController: nil)

    //private var channels = [Welcome]()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(collectionView)

        setupSearchBar()
        setupViews()
//        setupNavigationBar()

        setConstraints()
    }

    private func setupViews() {
        setupNavigationBar()

        let allButton = createCustomButton(title: "Все", selector: #selector(allButtonTapped))
        let favoriteButton = createCustomButton(title: "Избранные", selector: #selector(favoriteButtonTapped))

        navigationItem.leftBarButtonItems = [allButton, favoriteButton]
    }

    @objc private func allButtonTapped() {
        print("all Button Tapped")
    }

    @objc private func favoriteButtonTapped() {
        print("favorite Button Tapped")
    }

    private func setupSearchBar() {
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Напишите название телеканала"
        searchController.searchBar.tintColor = .lightGray
      //  searchController.searchBar.backgroundColor = .lightGray
       // searchController.searchBar.heightAnchor.constraint(equalToConstant: 100).isActive = true
        searchController.searchBar.barTintColor = .red

    }

//    private func setupNavigationBar() {
//        if #available(iOS 13.0, *) {
//            let navBarAppearance = UINavigationBarAppearance()
//            navBarAppearance.backgroundColor = #colorLiteral(red: 0.2112068534, green: 0.2286782756, blue: 0.2540599123, alpha: 1)
//
//            navigationController?.navigationBar.standardAppearance = navBarAppearance
//            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
//
//            navigationController?.navigationBar.prefersLargeTitles = false
//            navigationController?.navigationBar.tintColor = .white
//
////            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
//        } else {
//            navigationController?.navigationBar.tintColor = .darkGray
//        }
//    }
}

extension MainViewController {
    private func setConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {

    }
}
