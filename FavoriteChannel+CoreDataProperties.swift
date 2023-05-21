//
//  FavoriteChannel+CoreDataProperties.swift
//  TVPlayer
//
//  Created by Алексей Колыченков on 21.05.2023.
//
//

import Foundation
import CoreData


extension FavoriteChannel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteChannel> {
        return NSFetchRequest<FavoriteChannel>(entityName: "FavoriteChannel")
    }

    @NSManaged public var channelAdd: String?

}
