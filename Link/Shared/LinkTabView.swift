//
//  LinkTabView.swift
//  Link
//
//  Created by Jacob Strickler on 2/21/21.
//

import SwiftUI

struct LinkTabView: View {
    
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        TabView {
            NavigationView {
                HomeView()
            }
            .tabItem {
                Label("Home", systemImage: "star.fill")
            }
            .tag(Tab.home)
            
            NavigationView {
                ListsView()
            }
            .tabItem {
                Label("Lists", systemImage: "list.bullet")
            }
            .tag(Tab.lists)
            
            NavigationView {
                SettingsView()
            }
            .tabItem {
                Label("Settings", systemImage: "gearshape.fill")
            }
            .tag(Tab.settings)
        }
    }
}

extension LinkTabView {
    enum Tab {
        case home
        case lists
        case settings
    }
}

struct LinkTabView_Previews: PreviewProvider {
    static var previews: some View {
        LinkTabView()
            .environmentObject(ListStore())
    }
}
