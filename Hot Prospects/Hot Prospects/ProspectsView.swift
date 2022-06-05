//
//  ProspectsView.swift
//  Hot Prospects
//
//  Created by Noah Johnson on 4/18/22.
//

import SwiftUI

struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    let filter: FilterType
    
    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted People"
        case .uncontacted:
            return "Uncontacted People"
        }
    }
    
    @EnvironmentObject var prospects: Prospects
    
    var body: some View {
        NavigationView {
            Text("People: \(prospects.people.count)")
            
                .navigationTitle(title)
                .toolbar {
                    Button {
                        let prospect = Prospect()
                        prospect.name = "Paul Hudson"
                        prospect.emailAddress = "paul@hackingwithswift.com"
                        prospects.people.append(prospect)
                    } label: {
                        Label("Scan", systemImage: "qrcode.viewfinder")
                    }
                }
        }
    }
}

//struct ProspectsView_Previews: PreviewProvider {
//    @StateObject var prospects = Prospects()
//    
//    static var previews: some View {
//        ProspectsView(filter: .none)
//            .environmentObject(prospects)
//    }
//}
