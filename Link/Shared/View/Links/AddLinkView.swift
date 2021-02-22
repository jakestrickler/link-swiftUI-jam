//
//  AddLinkView.swift
//  Link (iOS)
//
//  Created by Jacob Strickler on 2/19/21.
//

import SwiftUI

struct AddLinkView: View {
    @EnvironmentObject private var listStore: ListStore
    @Environment(\.presentationMode) var presentationMode
    @State private var isLoading = false
    @State private var urlString = ""
    @State private var alertMessage: String?
    
    var list: LinkList
    
    var nextButtonDisabled: Bool {
        return urlString.isEmpty || isLoading
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("URL", text: $urlString)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
            }
            .overlay(
                Button(action: save) {
                    Group {
                        if !isLoading {
                            Text("Save Link")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        } else {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 48)
                    .background(Color.blue)
                    .cornerRadius(24)
                    .padding(12)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
                }
                .disabled(nextButtonDisabled),
                
                alignment: .bottom
            )
            .navigationTitle("Add Link")
            .navigationBarItems(trailing:
                Button(action: { presentationMode.wrappedValue.dismiss() }) {
                    Image(systemName: "xmark")
                        .font(.title2)
                }
            )
            .alert(item: $alertMessage) { message in
                Alert(
                    title: Text("Error Adding Link"),
                    message: Text(message)
                )
            }
        }
    }
    
    private func save() {
        guard let url = URL(string: urlString) else {
            self.alertMessage = "Invalid URL"
            return
        }
        
        isLoading = true
        
        listStore.addLink(url: url, to: list) { error in
            isLoading = false
            
            if let error = error {
                self.alertMessage = "Unable to fetch metadata: \(error.localizedDescription)"
                return
            }
            
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct AddLinkView_Previews: PreviewProvider {
    static var previews: some View {
        AddLinkView(list: ListStore.MockData.list)
    }
}
