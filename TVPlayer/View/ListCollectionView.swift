//
//  ListCollectionView.swift
//  TVPlayer
//
//  Created by Алексей Колыченков on 19.05.2023.
//

import UIKit

class ListCollectionView: UICollectionView {
    var dataFetcherService = DataFetcherService()

    var channelResponse: Welcome? = nil


    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize

        super.init(frame: .zero, collectionViewLayout: layout)
        register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reusableID)
        register(ChannelCell.self, forCellWithReuseIdentifier: ChannelCell.identifier)

        backgroundColor = #colorLiteral(red: 0.1164590665, green: 0.1260927762, blue: 0.1400881635, alpha: 1)
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
            guard let response = response else { return }
            self.channelResponse = response
            self.reloadData()
        }
    }

    private func configureCell(cell: ChannelCell, for indexPath: IndexPath) -> ChannelCell {
        guard let channel = channelResponse?.channels[indexPath.row] else { return ChannelCell()}

        cell.cellImageView.set(imageUrl: channel.image)
        cell.cellTitleLabel.text = channel.nameRu
        cell.cellDescriptionLabel.text = channel.current.title

        let select = cell.favoriteButton.isSelected ? cell.favoriteChannels[indexPath.item] : cell.nonFavoriteChannels[indexPath.item]

        cell.favoriteButton = select

//        cell.favoriteButton = cell.channels[indexPath.item]

        return cell
    }
}

extension ListCollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        channelResponse?.channels.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChannelCell.identifier,
                                                      for: indexPath)
        guard var cell = cell as? ChannelCell else { return UICollectionViewCell() }

        cell = configureCell(cell: cell, for: indexPath)
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 24, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: -60, left: 1, bottom: 1, right: 1)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ChannelCell
      
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.reusableID, for: indexPath) as! HeaderView

        header.configure()
        return header
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: frame.size.width, height: 120)
    }
}
