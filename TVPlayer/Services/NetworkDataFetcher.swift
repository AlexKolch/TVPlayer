//
//  NetworkDataFetcher.swift
//  TVPlayer
//
//  Created by Алексей Колыченков on 18.05.2023.
//

import Foundation

protocol DataFetcher {
    func fetchData<T: Decodable>(url: String, response: @escaping (T?) -> Void)
}

class NetworkDataFetcher: DataFetcher {

    var networking: Networking

    init(networking: Networking = NetworkService()) {
        self.networking = networking
    }

    //MARK: - decodeJSON
    func fetchData<T: Decodable>(url: String, response: @escaping (T?) -> Void) {
       
        networking.request(urlString: url) { data, error in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                response(nil)
            }

            guard let decoded = self.decodeJSON(type: T.self, from: data) else { return }
            response(decoded)
        }
    }

    func decodeJSON<T: Decodable>(type: T.Type, from data: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = data else { return nil }
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }
}
