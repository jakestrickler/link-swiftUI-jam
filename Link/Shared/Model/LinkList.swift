//
//  LinkList.swift
//  Link (iOS)
//
//  Created by Jacob Strickler on 2/19/21.
//

import Foundation

struct LinkList: Identifiable, Codable, Equatable {
    let id: UUID
    var title: String
    var links: [LinkItem]
    var isFavorite: Bool
}

extension LinkList {
    init() {
        self.id = UUID()
        self.title = ""
        self.links = []
        self.isFavorite = false
    }
    
    init(title: String, links: [LinkItem]) {
        self.id = UUID()
        self.title = title
        self.links = links
        self.isFavorite = false
    }
}
