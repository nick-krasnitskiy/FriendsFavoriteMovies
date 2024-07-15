//
//  Item.swift
//  FriendsFavoriteMovies
//
//  Created by Nick Krasnitskiy on 15.07.2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
