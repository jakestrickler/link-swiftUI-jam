//
//  LinkItem.swift
//  Link (iOS)
//
//  Created by Jacob Strickler on 2/19/21.
//

import Foundation

struct LinkItem: Identifiable, Codable, Equatable {
    let id: UUID
    let url: URL
    let name: String
    let siteName: String
    var isFavorite: Bool
    let dateAdded: Date
}

extension LinkItem {
    init(url: URL, name: String, siteName: String) {
        self.id = UUID()
        self.url = url
        self.name = name
        self.siteName = siteName
        self.isFavorite = false
        self.dateAdded = Date()
    }
}
