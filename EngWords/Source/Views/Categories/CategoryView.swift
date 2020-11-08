//
//  CategoryView.swift
//  EngWords
//
//  Created by Kirill Kunst on 28.09.2020.
//

import Foundation
import SwiftUI

struct CategoriesList: View {
    
    @Binding var category: Category
    
    var body: some View {
        VStack(spacing: 0) {
            Text(category.name).padding()
        }.font(.system(size: 18, weight: .bold, design: .rounded))
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesList(category: .constant(Category())).environmentObject(DataStore())
    }
}
