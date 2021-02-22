//
//  EmptyHomeItemView.swift
//  Link (iOS)
//
//  Created by Jacob Strickler on 2/21/21.
//

import SwiftUI

struct EmptyHomeItemView: View {
    
    let systemImageName: String
    let messageText: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: systemImageName)
            Text(messageText)
                .font(.callout)
        }
        .foregroundColor(.secondary)
        .listRowBackground(Color(.systemGroupedBackground))
    }
}

struct EmptyHomeItemView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyHomeItemView(
            systemImageName: "star.fill",
            messageText: "Some information about the empty state here. "
        )
        .previewLayout(.sizeThatFits)
    }
}
