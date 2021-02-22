//
//  AddListView.swift
//  Link (iOS)
//
//  Created by Jacob Strickler on 2/19/21.
//

import SwiftUI

struct AddListView: View {
    
    @EnvironmentObject private var listStore: ListStore
    @Environment(\.presentationMode) var presentationMode
    @State private var newList = LinkList()
    
    var saveButtonDisabled: Bool {
        return newList.title.isEmpty
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $newList.title)
                }
            }
            .overlay(
                Button(action: {
                    listStore.addList(newList)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save List")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 48)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(24)
                        .padding(12)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
                }
                .disabled(saveButtonDisabled),
                
                alignment: .bottom
            )
            .navigationTitle("Add List")
            .navigationBarItems(trailing:
                Button(action: { presentationMode.wrappedValue.dismiss() }) {
                    Image(systemName: "xmark")
                        .font(.title2)
                }
            )
        }
    }
}

struct AddListView_Previews: PreviewProvider {
    static var previews: some View {
        AddListView()
    }
}
