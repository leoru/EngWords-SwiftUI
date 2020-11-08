//
//  WordAdd.swift
//  EngWords
//
//  Created by Kirill Kunst on 04.11.2020.
//

import Foundation
import Foundation
import SwiftUI

struct WordAddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var data: DataStore
    
    @State private var enName: String = ""
    @State private var translation: String = ""
    @State private var categoryId: String = ""
    @State private var addMore = false
    
    var body: some View {
        NavigationView {
            Form {
                TextField("English", text: $enName).padding()
                TextField("Translation", text: $translation).padding()
                pickerView
                Toggle("Add more", isOn: $addMore)
            }
            .navigationBarTitle("Add Word", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button("Save") {
                                        self.save()
                                    }
            )
        }
    }
    
    var pickerView: AnyView {
        return AnyView(
            Section {
                Picker(selection: $categoryId, label: Text("Choose a category")) {
                    ForEach(0 ..< data.categories.count) {
                        Text(data.categories[$0].name).tag(data.categories[$0].id)
                    }
                }
            }
        )
    }
    
    private func clearInput() {
        self.translation = ""
        self.enName = ""
    }
    
    private func save() {
        var word = Word()
        word.translation = self.translation
        word.enName = self.enName
        word.categoryId = self.categoryId
        data.add(word: word)
        
        if addMore {
            self.clearInput()
        } else {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct WordAdd_Previews: PreviewProvider {
    static var previews: some View {
        WordAddView().environmentObject(DataStore())
    }
}
