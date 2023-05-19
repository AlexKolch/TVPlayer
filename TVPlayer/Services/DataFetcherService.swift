//
//  DataFetcherService.swift
//  TVPlayer
//
//  Created by Алексей Колыченков on 18.05.2023.
//

import Foundation
//MARK: - Запрос JSON
class DataFetcherService {
    var dataFetcher: DataFetcher
    let urlAPI = "http://limehd.online/playlist/channels.json"

    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }

    func fetchChannels(completion: @escaping (Welcome?) -> Void) {

        dataFetcher.fetchData(url: urlAPI, response: completion)
    }

    
}
