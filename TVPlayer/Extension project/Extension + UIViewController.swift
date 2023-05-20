//
//  Extension + UIViewController.swift
//  TVPlayer
//
//  Created by Алексей Колыченков on 20.05.2023.
//

import UIKit

extension UIViewController {
     func setupNavigationBar() {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.backgroundColor = #colorLiteral(red: 0.2112068534, green: 0.2286782756, blue: 0.2540599123, alpha: 1)

            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance

            navigationController?.navigationBar.prefersLargeTitles = false
            navigationController?.navigationBar.tintColor = .white

//            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        } else {
            navigationController?.navigationBar.tintColor = .darkGray
        }
    }

    func createCustomButton(title: String, selector: Selector) -> UIBarButtonItem {

        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)

        button.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        button.addTarget(self, action: selector, for: .touchUpInside)
        view.addSubview(button)

        let menuBarItem = UIBarButtonItem(customView: button)
        return menuBarItem
    }
}
