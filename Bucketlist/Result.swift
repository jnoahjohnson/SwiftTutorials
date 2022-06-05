//
//  Result.swift
//  Bucketlist
//
//  Created by Noah Johnson on 4/8/22.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable, Comparable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
    
    var description: String {
        terms?["description"]?.first ?? "No Further Information"
    }
    
    static func <(lhs: Page, rhs: Page) -> Bool {
        lhs.title < rhs.title
    }
}
