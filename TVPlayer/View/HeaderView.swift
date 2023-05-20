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
    let searchController = UISearchController(searchResultsController: nil)

    override init(frame: CGRect) {
        header = UIView(frame: .zero)
        super.init(frame: frame)
        self.addSubview(header)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSearchBar() {
       
    }

}
