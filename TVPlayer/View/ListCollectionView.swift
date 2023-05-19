//
//  ListCollectionView.swift
//  TVPlayer
//
//  Created by Алексей Колыченков on 19.05.2023.
//

import UIKit

class ListCollectionView: UICollectionView {
    var dataFetcherService = DataFetcherService()

    private var channels = [Welcome]()
    var channelResponse: Welcome? = nil
//    var color: [UIColor] = [.brown, .systemPink, .white, .black]

//    var itemsChannelArray: [Channel] = {
//        var channel = Channel()
//    }

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        //layout.minimumLineSpacing = 10
        //layout.minimumInteritemSpacing = 8

        //layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)

        super.init(frame: .zero, collectionViewLayout: layout)
        register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reusableID)
        register(ChannelCell.self, forCellWithReuseIdentifier: ChannelCell.identifier)


        backgroundColor = .systemGray
        contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8) ///внутренний отступ layout
        fetchData()
        dataSource = self
        delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fetchData() {
        dataFetcherService.fetchChannels { response in
            response?.channels.map({ channel in
                print(channel.nameRu, "WOW!!!!")
            })
            guard let response = response else { return }
            self.channelResponse = response
            self.reloadData()
//            self.channels.append(response)

        }
    }

    private func configureCell(cell: ChannelCell, for indexPath: IndexPath) -> ChannelCell {
        let channel = channelResponse?.channels[indexPath.row]
        //        let channel = channels[indexPath.row]

        cell.cellImageView.set(imageUrl: dataFetcherService.urlAPI)
        cell.cellTitleLabel.text = channel?.nameRu
        cell.cellDescriptionLabel.text = channel?.current.title

        return cell
    }


}

extension ListCollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        2
//    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        channelResponse?.channels.count ?? 0
//        channels.count
//        color.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChannelCell.identifier, for: indexPath)
        guard var cell = cell as? ChannelCell else { return UICollectionViewCell() }
       // cell.backgroundColor = color[indexPath.item]
        cell = configureCell(cell: cell, for: indexPath)
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (UIScreen.main.bounds.width - 48), height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ChannelCell
        cell.favoriteButton()
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.reusableID, for: indexPath)
        //   header.backgroundColor = .darkGray
        return header
    }
///Размер Header
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        CGSize(width: 0, height: 200)
//    }
}
