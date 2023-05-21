//
//  NetworkService.swift
//  TVPlayer
//
//  Created by Алексей Колыченков on 18.05.2023.
//

import Foundation

protocol Networking {
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void)
}

final class NetworkService: Networking {

    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }

        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }

    private func createDataTask(from requst: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: requst) { (data, _, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
}
