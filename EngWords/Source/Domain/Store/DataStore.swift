//
//  DataStore.swift
//  EngWords
//
//  Created by Kirill Kunst on 04.11.2020.
//

import Foundation
import SwiftUI
import Combine

final class DataStore: ObservableObject {

    private var realmHelper: RealmHelper
    
    // Categories setup
    private var categoriesCancellable: AnyCancellable?
    private(set) var categoriesStore = DataObservable<Category>()
    @Published private(set) var categories: [Category] = []
    
    // Words setup
    private var wordsCancellable: AnyCancellable?
    private(set) var wordsStore = DataObservable<Word>()
    @Published private(set) var words: [Word] = []
    
    init() {
        realmHelper = RealmHelper()
        categoriesStore = DataObservable<Category>()
        categoriesCancellable = categoriesStore.$items.assign(to: \.categories, on: self)
        
        wordsStore = DataObservable<Word>()
        wordsCancellable = wordsStore.$items.assign(to: \.words, on: self)
    }
    
    //MARK: - CRUD Categories
    
    func add(category: Category) {
        realmHelper.create(category.realmMap())
    }
    
    func category(for id: String) -> Category? {
        return self.categories.first(where: { $0.id == id })
    }
    
    func deleteCategories(at offsets: IndexSet) {
        realmHelper.deleteAt(RealmCategory.self, at: offsets, in: categories)
    }
    
    //MARK: - CRUD Words
    
    func add(word: Word) {
        realmHelper.create(word.realmMap())
    }
    
    func deleteWords(at offsets: IndexSet) {
        realmHelper.deleteAt(RealmWord.self, at: offsets, in: words)
    }
    
}
