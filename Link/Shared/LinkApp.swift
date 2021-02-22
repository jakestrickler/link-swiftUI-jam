//
//  LinkApp.swift
//  Shared
//
//  Created by Jacob Strickler on 2/19/21.
//

import SwiftUI

@main
struct LinkApp: App {

    @StateObject var listStore = ListStore()
    @StateObject var settingsStore = SettingsStore()

    var body: some Scene {
        WindowGroup {
            LinkTabView()
                .environmentObject(listStore)
                .environmentObject(settingsStore)
        }
    }
}
