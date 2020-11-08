//
//  CategoriesList.swift
//  EngWords
//
//  Created by Kirill Kunst on 04.11.2020.
//

import Foundation
import SwiftUI

struct CategoriesListView: View {
    @EnvironmentObject var data: DataStore
    @State var showingDetail = false
    
    var body: some View {
        Group {
            if !data.categories.isEmpty {
                categoriesListView
            } else {
                EmptyStateView(text: "No categories")
            }
        }.navigationBarTitle("Categories", displayMode: .inline)
        .navigationBarItems(trailing:
                        Button("Add") {
                            self.showingDetail.toggle()
                        }
                    )
        .sheet(isPresented: $showingDetail) {
            CategoryAddView().environmentObject(self.data)
        }
    }
    
    var categoriesListView: AnyView {
        return AnyView(
            List {
                ForEach(data.categories) { item in
                    CategoriesListItemView(category: item.realmBinding())
                        .contentShape(Rectangle())
                        .transition(.cell)
                }.onDelete(perform: data.deleteCategories(at:))
            }
        )
    }
}

struct CategoriesList_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesListView().environmentObject(DataStore())
    }
}

extension AnyTransition {
    static let cell = asymmetric(
        insertion: .move(edge: .bottom),
        removal: AnyTransition.scale(scale: 0.8).combined(with: .opacity)
    )
}
