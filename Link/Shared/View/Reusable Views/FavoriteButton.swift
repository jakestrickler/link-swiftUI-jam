//
//  FavoriteButton.swift
//  Link (iOS)
//
//  Created by Jacob Strickler on 2/21/21.
//

import SwiftUI

struct FavoriteButton: View {
    
    @Binding var isFavorite: Bool
    
    var imageName: String {
        return isFavorite ? "star.fill" : "star"
    }
    
    var body: some View {
        Button(action: {
            isFavorite.toggle()
        }, label: {
            Image(systemName: imageName)
                .foregroundColor(.yellow)
        })
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    
    @State static var isFavorite = false
    
    static var previews: some View {
        FavoriteButton(isFavorite: $isFavorite)
    }
}
