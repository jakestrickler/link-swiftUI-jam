//
//  ListStore.swift
//  Link (iOS)
//
//  Created by Jacob Strickler on 2/19/21.
//

import Foundation
import SwiftUI

class ListStore: ObservableObject {
    
    @Published var lists: [LinkList] = []
    
    
    var recentLinks: [LinkItem] {
        let allLinkssorted = lists.flatMap { $0.links }.sorted(by: { $0.dateAdded < $1.dateAdded })
        return Array(allLinkssorted.prefix(3))
    }
    
    var favoriteLists: [LinkList] {
        return lists.filter { $0.isFavorite }
    }
    
    var favoriteLinks: [LinkItem] {
        let allLinks = lists.flatMap { $0.links }
        return allLinks.filter { $0.isFavorite }
    }

    private let listsUserDefaultsKey = "lists"

    init() {
        getLists()
    }

    private func getLists() {
        guard let listData = UserDefaults.standard.data(forKey: listsUserDefaultsKey) else { return }
        let decoder = JSONDecoder()

        do {
            lists = try decoder.decode([LinkList].self, from: listData)
        } catch {
            fatalError("Error decoding lists.")
        }
    }

    func saveLists() {
        let encoder = JSONEncoder()

        do {
            let data = try encoder.encode(lists)
            UserDefaults.standard.setValue(data, forKey: listsUserDefaultsKey)
        } catch {
            fatalError("There was an error encoding the lists to save.")
        }
    }
    
    func addList(_ list: LinkList) {
        lists.append(list)
        saveLists()
    }

    func deleteLists(at offsets: IndexSet) {
        lists.remove(atOffsets: offsets)
        saveLists()
    }
    
    func addLink(url: URL, to list: LinkList, completion: @escaping (Error?) -> Void) {
        guard let index = lists.firstIndex(of: list) else { return }
        
        LinkService.shared.getLinkInfo(for: url) { result in
            switch result {
            case .success(let linkInfo):
                let link = LinkItem(
                    url: url,
                    name: linkInfo.pageName,
                    siteName: linkInfo.siteName
                )
                
                self.lists[index].links.append(link)
                self.saveLists()
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    func deleteLinks(at offsets: IndexSet, from list: LinkList) {
        guard let listIndex = lists.firstIndex(of: list) else { return }
        lists[listIndex].links.remove(atOffsets: offsets)
        saveLists()
    }
}
