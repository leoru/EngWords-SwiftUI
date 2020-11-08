//
//  RealmConvertible.swift
//  EngWords
//
//  Created by Kirill Kunst on 04.11.2020.
//

import Foundation
import RealmSwift
import SwiftUI

protocol RealmConvertible where Self:Equatable & UUIDIdentifiable & Initializable {
    associatedtype RealmType: Object & UUIDIdentifiable
    
    func realmMap() -> RealmType
    
    init(_ dest:RealmType)
}

/// Dynamic Realm Binding for live data editing
extension RealmConvertible {
    
    func realmBinding() -> Binding<Self> {
        let helper = RealmHelper()
        return Binding<Self>(get: {
            if let r = helper.get(self.realmMap()) {
                return Self(r)
            }
            return self
        }, set: helper.updateConvertible)
    }
}

