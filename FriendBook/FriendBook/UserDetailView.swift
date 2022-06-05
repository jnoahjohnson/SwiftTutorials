//
//  UserDetailView.swift
//  FriendBook
//
//  Created by Noah Johnson on 3/23/22.
//

import SwiftUI

struct UserDetailView: View {
    var user: CachedUser
    
    var body: some View {
        List {
            Section {
                Text(user.wrappedAbout)
                    .padding(.vertical)
            } header: {
                Text("About")
            }
            
            Section {
                Text("Address: \(user.wrappedAddress)")
                Text("Company: \(user.wrappedCompany)")
            } header: {
                Text("Contact Details")
            }
            
            Section {
                ForEach(user.friendsArray) { friend in
                    Text(friend.wrappedName)
                }
            } header: {
                Text("Friends")
            }
            .listStyle(.grouped)
            .navigationTitle(user.wrappedName)
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
//
//struct UserDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserDetailView(user: User())
//    }
//}
