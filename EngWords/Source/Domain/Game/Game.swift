//
//  Game.swift
//  EngWords
//
//  Created by Kirill Kunst on 04.11.2020.
//

import Foundation
import SwiftUI

final class Game {
    
    private var store: DataStore
    private var type: GameType
    private var playedWords: [Word] = []
    public var category: Category?
    
    public var title: String {
        if let category = self.category {
            return "Learn \(category.name)"
        }
        return "Learn"
    }
    
    init(type: GameType,
         store: DataStore,
         category: Category?) {
        self.type = type
        self.store = store
        self.category = category
    }
    
    //MARK: - Actions
    
    func nextWord() -> Word? {
        var words = self.store.words.filter({ !playedWords.contains($0) })
        
        if let categoryId = self.category?.id {
            words = words.filter({ $0.categoryId == categoryId })
        }
        
        let word = words.randomElement()
        return word
    }
    
    
    func check(word: Word, input: String) -> Bool {
        if self.compareText(for: word) == input.lowercased() {
            playedWords.append(word)
            return true
        }
        
        return false
    }
    
    func textToTranslate(for word: Word) -> String {
        switch self.type {
        case .fromEnglish:
            return word.enName.capitalized
        default:
            return word.translation.capitalized
        }
    }
    
    private func compareText(for word: Word) -> String {
        switch self.type {
        case .fromEnglish:
            return word.translation.lowercased()
        default:
            return word.enName.lowercased()
        }
    }
    
}
