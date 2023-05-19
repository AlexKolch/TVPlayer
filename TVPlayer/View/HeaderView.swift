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

    override init(frame: CGRect) {
        header = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 150))
        super.init(frame: frame)
        self.addSubview(header)
        self.backgroundColor = .darkGray
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
