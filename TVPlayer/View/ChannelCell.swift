//
//  CollectionViewCell.swift
//  TVPlayer
//
//  Created by Алексей Колыченков on 18.05.2023.
//

import UIKit

class ChannelCell: UICollectionViewCell {
    static let identifier = "CellID"

     var cellImageView: WebImageManager = {
        let imageView = WebImageManager()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

     var activityIndicator: UIActivityIndicatorView = {
       let activityIndicatorView = UIActivityIndicatorView()
       activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
       activityIndicatorView.hidesWhenStopped = true
       return activityIndicatorView
   }()

     var cellTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

     var cellDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        label.lineBreakMode = .byClipping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = #colorLiteral(red: 0.2117647059, green: 0.2274509804, blue: 0.2549019608, alpha: 1)
        contentView.layer.cornerRadius = 20

        contentView.addSubviews(cellImageView, cellTitleLabel, cellDescriptionLabel, activityIndicator)
        favoriteButton()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    override func layoutSubviews() {
//        super.layoutSubviews()
//        self.layer.cornerRadius = 20
//    }

    func favoriteButton() {
        let filledStar = #imageLiteral(resourceName: "filledStar")
        let highlighterStar = #imageLiteral(resourceName: "highlightedStar")
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false

        button.setImage(filledStar.withRenderingMode(.alwaysTemplate), for: .normal)
        button.setImage(highlighterStar, for: .selected)
        button.tintColor = .lightGray

        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)

        contentView.addSubview(button)
        button.widthAnchor.constraint(equalToConstant: 28).isActive = true
        button.heightAnchor.constraint(equalToConstant: 28).isActive = true
        button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25).isActive = true
    }

    @objc func tapButton(button: UIButton) {
        print("Tap Button")
        button.isSelected = true
    }


    private func setConstraints() {
        NSLayoutConstraint.activate([
            cellImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            cellImageView.heightAnchor.constraint(equalToConstant: 75),
            cellImageView.widthAnchor.constraint(equalToConstant: 75),

            cellTitleLabel.topAnchor.constraint(equalTo: cellImageView.topAnchor, constant: 5),
            cellTitleLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 12),

            cellDescriptionLabel.topAnchor.constraint(equalTo: cellTitleLabel.bottomAnchor, constant: 8),
            cellDescriptionLabel.leadingAnchor.constraint(equalTo: cellTitleLabel.leadingAnchor),
//            cellDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),

            activityIndicator.centerXAnchor.constraint(equalTo: cellImageView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: cellImageView.centerYAnchor)
        ])
    }
}
