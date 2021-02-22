//
//  LinkCell.swift
//  Link (iOS)
//
//  Created by Jacob Strickler on 2/20/21.
//

import SwiftUI

struct LinkCell: View {
    
    let link: LinkItem
    
    var body: some View {
        HStack(spacing: 15) {
            Image("apple")
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipped()
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 3) {
                Text(link.name)
                    .font(.headline)
                Text(link.siteName)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct LinkCell_Previews: PreviewProvider {
    static var previews: some View {
        LinkCell(link: ListStore.MockData.link)
            .previewLayout(.sizeThatFits)
    }
}
