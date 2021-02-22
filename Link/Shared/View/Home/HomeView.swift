//
//  HomeView.swift
//  Link (iOS)
//
//  Created by Jacob Strickler on 2/21/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var listStore: ListStore
    
    var body: some View {
        List {
            Section(header: Text("Recently Added")) {
                if listStore.recentLinks.isEmpty {
                    EmptyHomeItemView(
                        systemImageName: "clock",
                        messageText: "Nothing recent links! Head to the lists tab to save new links. "
                    )
                } else {
                    ForEach(listStore.recentLinks) { link in
                        Link(destination: link.url) {
                            LinkCell(link: link)
                        }
                    }
                }
            }
            
            Section(header: Text("Favorite Lists")) {
                if listStore.favoriteLists.isEmpty {
                    EmptyHomeItemView(
                        systemImageName: "list.star",
                        messageText: "No favorite lists! Swipe on your lists from the list tap to add them to your favorites."
                    )
                } else {
                    ForEach(listStore.favoriteLists.indices) { index in
                        NavigationLink(destination: Text("Destination")) {
                            ListCell(list: $listStore.favoriteLists[index])
                        }
                    }
                }
            }
            
            Section(header: Text("Favorite Links")) {
                if listStore.favoriteLinks.isEmpty {
                    EmptyHomeItemView(
                        systemImageName: "star",
                        messageText: "No favorite links! Swipe on a link from one of your lists to add it to your favorites."
                    )
                } else {
                    ForEach(listStore.favoriteLinks) { link in
                        NavigationLink(destination: Text("Destination")) {
                            LinkCell(link: link)
                        }
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationTitle("Home")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .environmentObject(ListStore())
        }
    }
}
