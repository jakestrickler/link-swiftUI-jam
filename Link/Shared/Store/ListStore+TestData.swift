//
//  ListStore+TestData.swift
//  Link (iOS)
//
//  Created by Jacob Strickler on 2/19/21.
//

import Foundation

extension ListStore {
    enum MockData {
        static let list = LinkList(
            title: "SwiftUI",
            links: [link]
        )
        
        static let link = LinkItem(
            url: URL(string: "www.apple.com")!,
            name: "Apple Homepage",
            siteName: "Apple"
        )
    }
}
