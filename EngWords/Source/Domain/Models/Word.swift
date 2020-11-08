//
//  Word.swift
//  EngWords
//
//  Created by Kirill Kunst on 04.11.2020.
//

import Foundation
import RealmSwift

// Realm Model
class RealmWord: Object, UUIDIdentifiable {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var translation: String = ""
    @objc dynamic var enName: String = ""
    @objc dynamic var categoryId: String?
    @objc dynamic var created = Date()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

// UI Model
struct Word: Equatable, UUIDIdentifiable {
    var id: String = UUID().uuidString
    var translation: String = ""
    var enName: String = ""
    var categoryId: String?
    var created = Date()
}

// Mappings
extension RealmWord {
    convenience init(_ obj: Word) {
        self.init()
        self.id = obj.id
        self.translation = obj.translation
        self.enName = obj.enName
        self.created = obj.created
        self.categoryId = obj.categoryId
    }
}

extension Word: RealmConvertible {
    func realmMap() -> RealmWord {
        RealmWord(self)
    }
    
    init(_ obj: RealmWord) {
        self.id = obj.id
        self.translation = obj.translation
        self.enName = obj.enName
        self.created = obj.created
        self.categoryId = obj.categoryId
    }
}
