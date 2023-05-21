//
//  FavoriteButton.swift
//  TVPlayer
//
//  Created by Алексей Колыченков on 21.05.2023.
//

import UIKit

class FavoriteButton: UIView {

    private var favoriteChannels: [UIButton] = []

//    var isSelected = false {
//        didSet {
//            updateSelectedButton()
//        }
//    }

    func setupButton() {
        let filledStar = #imageLiteral(resourceName: "filledStar")
        let highlighterStar = #imageLiteral(resourceName: "highlightedStar")
      //  var isSelectChannel: Bool = false
        let button = UIButton()

        favoriteChannels.append(button)
//        updateFavoriteChannel(button: button)

        button.setImage(filledStar.withRenderingMode(.alwaysTemplate), for: .normal)
        button.setImage(highlighterStar, for: .selected)
        button.tintColor = .lightGray
      //  button.isSelected = UserDefaults.standard.bool(forKey: isSelect)


        button.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)

//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.widthAnchor.constraint(equalToConstant: 28).isActive = true
//        button.heightAnchor.constraint(equalToConstant: 28).isActive = true
//        button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
//        button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25).isActive = true
    }

    @objc func favoriteButtonTapped(button: UIButton, indexPath: IndexPath) {
        print("Tap Button")
        guard let index = favoriteChannels.firstIndex(of: button) else {return}


        for channel in favoriteChannels {

            if let favorite = channel as? UIButton {
                favorite.isSelected.toggle()
            }
        }

        if index is UIButton  {

        }
        button.isSelected.toggle()


      //  UserDefaults.standard.set(button.isSelected, forKey: isSelect)
    }

    private func updateFavoriteChannel(button: UIButton) {
        let filledStar = #imageLiteral(resourceName: "filledStar")
        let highlighterStar = #imageLiteral(resourceName: "highlightedStar")
        for channel in favoriteChannels {
            if channel.isSelected {
                button.setImage(highlighterStar, for: .selected)
            } else {
                button.setImage(filledStar.withRenderingMode(.alwaysTemplate), for: .normal)
            }
        }
    }
}
