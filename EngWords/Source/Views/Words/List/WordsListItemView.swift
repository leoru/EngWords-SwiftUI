//
//  WordListItem.swift
//  EngWords
//
//  Created by Kirill Kunst on 29.09.2020.
//

import Foundation
import SwiftUI

struct WordsListItemView: View {
    
    @Binding var word: Word
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(word.enName).modifier(ListItemGenericModifier())
        }
    }
}

struct WordsListItem_Previews: PreviewProvider {
    static var previews: some View {
        WordsListItemView(word: .constant(Word())).environmentObject(DataStore())
    }
}
