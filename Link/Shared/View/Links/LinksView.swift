//
//  LinksView.swift
//  Link (iOS)
//
//  Created by Jacob Strickler on 2/19/21.
//

import SwiftUI

struct LinksView: View {
    
    @EnvironmentObject private var listStore: ListStore
    @State private var showingAddLink = false
    @Binding var list: LinkList
    
    var body: some View {
        VStack {
            List {
                ForEach(list.links) { linkItem in
                    Link(destination: linkItem.url) {
                        LinkCell(link: linkItem)
                    }
                }
                .onDelete(perform: { indexSet in
                    listStore.deleteLinks(at: indexSet, from: list)
                })
            }
            .listStyle(PlainListStyle())
            
            Button(action: { showingAddLink = true }) {
                Text("+ Add Link")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 48)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(24)
                    .padding(12)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
            }
        }
        .navigationTitle(list.title)
        .navigationBarItems(trailing: EditButton())
        .sheet(isPresented: $showingAddLink) {
            AddLinkView(list: list)
        }
    }
}

struct LinksView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LinksView(list: .constant(ListStore.MockData.list))
        }
    }
}
