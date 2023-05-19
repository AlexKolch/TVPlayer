//
//  CollectionViewCell.swift
//  TVPlayer
//
//  Created by Алексей Колыченков on 18.05.2023.
//

import UIKit

//protocol CellTVProtocol {
//    var identifier: String { get }
//    var height: Double { get }
//    var title: String { get }
//    var description: String { get }
//    var imageURL: String { get }
//}

class ChannelCell: UICollectionViewCell {
    static let identifier = "CellID"

    lazy var cellImageView: WebImageManager = {
        let imageView = WebImageManager()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    lazy var activityIndicator: UIActivityIndicatorView = {
       let activityIndicatorView = UIActivityIndicatorView()
       activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
       activityIndicatorView.hidesWhenStopped = true
       return activityIndicatorView
   }()

    lazy var cellTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var cellDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 8)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubviews(cellImageView, cellTitleLabel, cellDescriptionLabel, activityIndicator)
        favoriteButton()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func favoriteButton() {
        let filledStar = #imageLiteral(resourceName: "filledStar")
        let highlighterStar = #imageLiteral(resourceName: "highlightedStar")
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(filledStar, for: .normal)
        button.setImage(highlighterStar, for: .selected)

        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)

        contentView.addSubview(button)
        button.widthAnchor.constraint(equalToConstant: 25).isActive = true
        button.heightAnchor.constraint(equalToConstant: 25).isActive = true
        button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
    }

    @objc func tapButton(button: UIButton) {
        print("Tap Button")
    }



//    func configure(data: CellTVProtocol) {
//        cellImageView.set(imageUrl: data.imageURL)
//        cellTitleLabel.text = data.title
//        cellDescriptionLabel.text = data.description
//    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            cellImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            cellImageView.trailingAnchor.constraint(equalTo: cellTitleLabel.leadingAnchor, constant: -8),
            cellImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            cellTitleLabel.topAnchor.constraint(equalTo: cellImageView.topAnchor),
            cellTitleLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 8),

            cellDescriptionLabel.topAnchor.constraint(equalTo: cellTitleLabel.bottomAnchor, constant: 8),
            cellDescriptionLabel.leadingAnchor.constraint(equalTo: cellTitleLabel.leadingAnchor),

            activityIndicator.centerXAnchor.constraint(equalTo: cellImageView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: cellImageView.centerYAnchor)
        ])
    }
}
