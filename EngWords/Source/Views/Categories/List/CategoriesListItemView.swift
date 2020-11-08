//
//  CategoryView.swift
//  EngWords
//
//  Created by Kirill Kunst on 04.11.2020.
//

import Foundation
import SwiftUI

struct CategoriesListItemView: View {
    
    @Binding var category: Category
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(category.name)
                .modifier(ListItemGenericModifier())
        }
        
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesListItemView(category: .constant(Category())).environmentObject(DataStore())
    }
}
