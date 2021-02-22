//
//  ListCell.swift
//  Link (iOS)
//
//  Created by Jacob Strickler on 2/20/21.
//

import SwiftUI

struct ListCell: View {
    
    @Binding var list: LinkList
    
    var numberOfLinksText: String {
        let count = list.links.count
        
        if count == 1 {
            return "\(count) link"
        } else {
            return "\(count) links"
        }
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 3) {
                Text(list.title)
                    .font(.headline)
                Text(numberOfLinksText)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            FavoriteButton(isFavorite: $list.isFavorite)
        }
    }
}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(list: .constant(ListStore.MockData.list))
    }
}
