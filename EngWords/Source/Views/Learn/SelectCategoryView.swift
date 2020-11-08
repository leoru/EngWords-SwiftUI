//
//  SelectCategoryView.swift
//  EngWords
//
//  Created by Kirill Kunst on 04.11.2020.
//

import Foundation
import SwiftUI

struct SelectCategoryView: View {
    @EnvironmentObject var data: DataStore
    private var gameType: GameType
    
    init(gameType: GameType) {
        self.gameType = gameType
    }
    
    var body: some View {
        Group {
            if !data.categories.isEmpty {
                categoriesListView
            } else {
                EmptyStateView(text: "No categories")
            }
        }.navigationBarTitle("Select category", displayMode: .inline)
    }
    
    var categoriesListView: AnyView {
        return AnyView(
            ScrollView {
                VStack(spacing:20) {
                    ForEach(data.categories) { item in
                        listItemView(for: item)
                    }
                    .onDelete(perform: data.deleteCategories(at:))
                    Spacer()
                }.padding(.vertical)
            }
        )
    }
    
    private func listItemView(for category: Category) -> AnyView {
        return AnyView(
            NavigationLink(destination: gameView(category: category)) {
                CategoriesListItemView(category: category.realmBinding())
                    .contentShape(Rectangle())
                    .transition(.cell)
            }.foregroundColor(Color.black)
        )
    }
    
    func gameView(category: Category) -> GameView {
        GameView(game: Game(type: self.gameType, store: self.data, category: category))
    }
}
