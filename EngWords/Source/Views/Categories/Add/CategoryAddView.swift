//
//  CategoryAdd.swift
//  EngWords
//
//  Created by Kirill Kunst on 04.11.2020.
//

import Foundation
import SwiftUI

struct CategoryAddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var data: DataStore
    
    @State private var name: String = ""
    @State private var addMore = false
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name).padding()
                Toggle("Add more", isOn: $addMore)
            }
            .navigationBarTitle("Add Category", displayMode: .inline)
            .navigationBarItems(trailing:
                            Button("Save") {
                                self.save()
                            }
                        )
        }
    }
    
    private func save() {
        let value: String = self.name
        var category = Category()
        category.name = value
        data.add(category: category)
        
        if addMore {
            self.name = ""
        } else {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct CategoryAdd_Previews: PreviewProvider {
    static var previews: some View {
        CategoryAddView().environmentObject(DataStore())
    }
}
