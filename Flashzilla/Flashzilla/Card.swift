//
//  Card.swift
//  Flashzilla
//
//  Created by Noah Johnson on 5/14/22.
//

struct Card: Codable {
    let prompt: String
    let answer: String
    
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
