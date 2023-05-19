//
//  ViewController.swift
//  TVPlayer
//
//  Created by Алексей Колыченков on 18.05.2023.
//

import UIKit

class MainViewController: UIViewController {
    var dataFetcherService = DataFetcherService()
  
    private var channels = [Channel]()

    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
       // layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 32)/3, height: 100)
        layout.scrollDirection = .vertical

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .black
        collectionView.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        collectionView.register(ChannelCell.self, forCellWithReuseIdentifier: ChannelCell.identifier)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemPink
        dataFetcherService.fetchChannels { response in
            print(response?.channels ?? "")
            guard let response = response else { return }
            self.channels = response.channels
            print(self.channels)
        }
        view.addSubview(collectionView)

        collectionView.dataSource = self
        collectionView.delegate = self

      //  fetchData()
    }
//    func fetchData() {
//        NetworkDataFetcher.fetchData(url: urlString) { channel in
//
//            self.channels = channel
//        }
//    }
//    private func configureCell(cell: ChannelCell, for indexPath: IndexPath) {
//        let channel = channels[indexPath.row]
//        cell.cellImageView.set(imageUrl: urlString)
//        cell.cellTitleLabel.text = channel.nameRu
//
//    }

}

extension MainViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
// MARK: - DataSource Delegate
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        default: return channels.count
       // default: return channels.cells.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellData = channels[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChannelCell.identifier, for: indexPath)
        guard let cell = cell as? ChannelCell else {return UICollectionViewCell()}
       // configureCell(cell: cell, for: indexPath)
        cell.cellTitleLabel.text = cellData.nameRu
        cell.cellImageView.set(imageUrl: cellData.image)
       // cell.configure(data: cellData)
        return cell
    }

}

// MARK: - DelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {

}

