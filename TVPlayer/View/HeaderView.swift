//
//  HeaderView.swift
//  TVPlayer
//
//  Created by Алексей Колыченков on 19.05.2023.
//

import UIKit

class HeaderView: UICollectionReusableView {
    static let reusableID = "HeaderID"
    var header: UIView!

    var allButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Все", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(HeaderView.self, action: #selector(allButtonTapped), for: .touchUpInside)
        return button
    }()

    var favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Избранные", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(HeaderView.self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc private func allButtonTapped() {
        print("all Button Tapped")
    }

    @objc private func favoriteButtonTapped() {
        print("favorite Button Tapped")
    }

    override init(frame: CGRect) {
        header = UIView(frame: .zero)
        super.init(frame: frame)
        self.addSubview(header)
        header.addSubviews(allButton, favoriteButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        backgroundColor = #colorLiteral(red: 0.2112068534, green: 0.2286782756, blue: 0.2540599123, alpha: 1)
        setConstraints()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.frame = CGRect(x: -10, y: -10, width: UIScreen.main.bounds.width, height: 50)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            allButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            allButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),

            favoriteButton.topAnchor.constraint(equalTo: allButton.topAnchor),
            favoriteButton.leadingAnchor.constraint(equalTo: allButton.trailingAnchor, constant: 30)
        ])
    }
}
