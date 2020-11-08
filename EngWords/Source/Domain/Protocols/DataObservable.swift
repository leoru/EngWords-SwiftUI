//
//  DataObservable.swift
//  EngWords
//
//  Created by Kirill Kunst on 04.11.2020.
//

import Foundation
import UIKit
import SwiftUI
import RealmSwift

class DataObservable<Type:RealmConvertible>: ObservableObject {
    
    private let helper = RealmHelper()
    private var notificationTokens: [NotificationToken] = []
    private var realmItems: RealmSwift.Results<Type.RealmType>
    
    @Published private(set) var items: [Type]
    
    init(_ filter: String = "") {
        
        realmItems = helper.list(Type.RealmType.self)
        
        if !filter.isEmpty {
            realmItems = realmItems.filter(filter)
        }
        
        self.items = realmItems.map { Type($0) }
        
        watchRealm()
    }
    
    private func watchRealm() {
        self.notificationTokens.append(realmItems.observe { _ in
            self.updateItems()
        })
    }
    
    private func updateItems() {
        DispatchQueue.main.async {
            self.items = self.realmItems.map { Type($0) }
        }
    }
    
    deinit { notificationTokens = [] }

}
