//
//  RealmHelper.swift
//  EngWords
//
//  Created by Kirill Kunst on 04.11.2020.
//

import Foundation
import RealmSwift

extension Realm {
    static func create(_ data: Object) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(data)
        }
    }
    
    static func destroyAllData() {
        try! FileManager.default.removeItem(at: Self.Configuration.defaultConfiguration.fileURL!)
    }
    
    static func clearAllData() {
        do {
            let realm = try? Self()
            try realm?.write {
                realm?.deleteAll()
            }
        } catch let e {
            print("realm error: ", e.localizedDescription)
        }
    }
}

extension Object {
    static func load(from id: String) -> Self? {
        let realm = try? Realm()
        return realm?.object(ofType: Self.self, forPrimaryKey: id)
    }
}

struct RealmHelper {
    
    let realm:Realm
    
    init() { realm = try! Realm() }
    
    //MARK: - Create
    
    func create<O:Object>(_ o:O) {
        try? realm.write {
            realm.add(o)
        }
    }
    
    //MARK: - Update
    
    func update<O:Object>(o:O) {
        _ = try? realm.write {
            realm.create(O.self, value:o, update: .modified)
        }
    }
    
    func updateConvertible<C:RealmConvertible>(_ c:C) {
        _ = try? realm.write {
            realm.create(C.RealmType.self, value:c.realmMap(), update: .modified)
        }
    }
    
    //MARK: - Get
    
    func get<O:Object & UUIDIdentifiable>(_ o:O) -> O? {
        realm.object(ofType: O.self, forPrimaryKey: o.id)
    }
    
    func getById<O: Object>(_ o: O.Type, id: String) -> O? {
        realm.object(ofType: O.self, forPrimaryKey: id)
    }
    
    //MARK: - Delete
    
    func delete<O:Object & UUIDIdentifiable>(_ o:O) {
        if let d = get(o) {
            try? realm.write {
                realm.delete(d)
            }
        }
    }
    
    func deleteAt<O:Object & UUIDIdentifiable, T: RealmConvertible & UUIDIdentifiable>(_ o: O.Type, at offsets: IndexSet, in list: [T]) {
        offsets.forEach { (index) in
            let item = list[index]
            let realmItem: O? = self.getById(T.RealmType.self, id: item.id) as? O
            
            if let realmItem = realmItem {
                self.delete(realmItem)
            }
        }
    }
    
    //MARK: - List
    
    func list<O:Object>(_ o:O.Type) -> RealmSwift.Results<O> {
        realm.objects(o)
    }
}
