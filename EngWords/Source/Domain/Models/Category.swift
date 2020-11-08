//
//  Category.swift
//  EngWords
//
//  Created by Kirill Kunst on 04.11.2020.
//

import Foundation
import RealmSwift

// Realm Model
class RealmCategory: Object, UUIDIdentifiable {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var created = Date()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

// UI Model
struct Category: Equatable, UUIDIdentifiable {
    var id: String = UUID().uuidString
    var name: String = ""
    var created = Date()
}

// Mappings
extension RealmCategory {
    convenience init(_ obj: Category) {
        self.init()
        self.id = obj.id
        self.name = obj.name
        self.created = obj.created
    }
}

extension Category: RealmConvertible {
    
    func realmMap() -> RealmCategory {
        RealmCategory(self)
    }
    
    init(_ obj: RealmCategory) {
        self.id = obj.id
        self.name = obj.name
        self.created = obj.created
    }
}
