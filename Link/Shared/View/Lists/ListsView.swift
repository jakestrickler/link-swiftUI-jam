//
//  ListsView.swift
//  Shared
//
//  Created by Jacob Strickler on 2/19/21.
//

import SwiftUI

struct ListsView: View {
    
    @EnvironmentObject private var listStore: ListStore
    @State var displayingAddList = false
    
    var body: some View {
        VStack {
            List {
                ForEach(listStore.lists.indices, id: \.self) { index in
                    NavigationLink(destination: LinksView(list: $listStore.lists[index])) {
                        ListCell(list: listStore.lists[index])
                    }
                }
                .onDelete(perform: listStore.deleteLists)
            }
            .listStyle(PlainListStyle())
            
            
            Button(action: { displayingAddList = true }) {
                Text("+ Add List")
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
        .navigationTitle("Lists")
        .navigationBarItems(trailing: EditButton())
        .sheet(isPresented: $displayingAddList) {
            AddListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListsView()
            .environmentObject(ListStore())
    }
}
