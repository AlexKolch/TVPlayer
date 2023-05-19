//
//  Channels.swift
//  TVPlayer
//
//  Created by Алексей Колыченков on 18.05.2023.
//

import Foundation

struct Welcome: Codable {
    let channels: [Channel]
}

struct Channel: Codable {
    let nameRu: String
    let image: String
    let current: Current
}

struct Current: Codable {
    let title: String
}
