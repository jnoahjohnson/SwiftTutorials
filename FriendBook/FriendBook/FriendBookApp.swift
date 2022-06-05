//
//  FriendBookApp.swift
//  FriendBook
//
//  Created by Noah Johnson on 3/23/22.
//

import SwiftUI

@main
struct FriendBookApp: App {
    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
