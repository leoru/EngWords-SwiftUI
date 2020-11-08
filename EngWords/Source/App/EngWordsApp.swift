//
//  EngWordsApp.swift
//  EngWords
//
//  Created by Kirill Kunst on 04.11.2020.
//

import SwiftUI

@main
struct EngWordsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(DataStore())
        }
    }
}
