//
//  Channels.swift
//  TVPlayer
//
//  Created by Алексей Колыченков on 18.05.2023.
//

import Foundation

struct Welcome: Decodable {
//    static func == (lhs: Welcome, rhs: Welcome) -> Bool {
//        guard lhs.hashValue == rhs.hashValue else {return false}
//        return true
//    }

    let channels: [Channel]
}

struct Channel: Decodable {
    let nameRu: String
    let image: String
    let current: Current
}

struct Current: Decodable {
    let title: String
}
