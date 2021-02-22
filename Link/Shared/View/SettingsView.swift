//
//  SettingsView.swift
//  Link (iOS)
//
//  Created by Jacob Strickler on 2/21/21.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject private var settingsStore: SettingsStore
    
    var body: some View {
        List {
            
        }
        .listStyle(GroupedListStyle())
        .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView()
        }
    }
}
