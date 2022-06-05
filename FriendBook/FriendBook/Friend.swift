//
//  Friend.swift
//  FriendBook
//
//  Created by Noah Johnson on 3/24/22.
//

import Foundation

struct Friend: Codable, Identifiable {
    var id: UUID
    var name: String
}
