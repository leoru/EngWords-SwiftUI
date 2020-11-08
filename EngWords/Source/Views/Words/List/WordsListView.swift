//
//  WordsList.swift
//  EngWords
//
//  Created by Kirill Kunst on 04.11.2020.
//

import Foundation
import SwiftUI

struct WordsListView: View {
    @EnvironmentObject var data: DataStore
    @State private var showingDetail = false
    
    var body: some View {
        Group {
            if !data.words.isEmpty {
                List {
                    ForEach(data.words) { word in
                        listItemView(for: word)
                    }.onDelete(perform: data.deleteWords(at:))
                }
            } else {
                EmptyStateView(text: "No words, add new one")
            }
        }.navigationBarTitle("Words", displayMode: .inline)
        .navigationBarItems(trailing:
                        Button("Add") {
                            self.showingDetail.toggle()
                        }
                    )
        .sheet(isPresented: $showingDetail) {
            WordAddView().environmentObject(self.data)
        }
    }
    
    private func listItemView(for word: Word) -> AnyView {
        return AnyView(
            WordsListItemView(word: word.realmBinding())
                .contentShape(Rectangle())
                .transition(.cell)
        )
    }
}

struct WordsList_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesListView().environmentObject(DataStore())
    }
}
