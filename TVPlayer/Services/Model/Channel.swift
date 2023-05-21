//
//  Channels.swift
//  TVPlayer
//
//  Created by Алексей Колыченков on 18.05.2023.
//

import Foundation

struct Channel: Decodable {
    let nameRu: String
    let image: String
    let current: Current
}

struct Current: Decodable {
    let title: String
}
