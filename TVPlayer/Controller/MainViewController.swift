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
  
//    private var channels = [Channel]()
    private var channels = [Welcome]()
//    var itemsChannelArray: [Channel] = {
//        var channel = Channel()
//        return channel
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        dataFetcherService.fetchChannels { response in
//            print(response?.channels ?? "")
//            guard let response = response else { return }
//            self.channels.append(response)
//            self.channels = response.channels
//        }
        self.view.addSubview(collectionView)
        setConstraints()
    }
   
//    private func configureCell(cell: ChannelCell, for indexPath: IndexPath) {
//        let channel = channels[indexPath.row]
//        if let channel = channel as? Channel {
//            cell.cellImageView.set(imageUrl: dataFetcherService.urlAPI)
//            cell.cellTitleLabel.text = channel.nameRu
//            cell.cellDescriptionLabel.text = channel.current.title
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
