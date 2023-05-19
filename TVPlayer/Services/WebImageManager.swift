//
//  WebImageManager.swift
//  TVPlayer
//
//  Created by Алексей Колыченков on 18.05.2023.
//

import UIKit

class WebImageManager: UIImageView {

    func set(imageUrl: String) {
        guard let url = URL(string: imageUrl) else {return}

        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            DispatchQueue.main.async {
                if let data = data {
                    self?.image = UIImage(data: data)
                }
            }
        }
        dataTask.resume()
    }
}
