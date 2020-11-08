//
//  GameType.swift
//  EngWords
//
//  Created by Kirill Kunst on 04.11.2020.
//

import Foundation

enum GameType: String, CaseIterable {
    
    case fromEnglish
    case toEnglish
    
    var title: String {
        switch self {
        case .fromEnglish:
            return "From English"
        case .toEnglish:
            return "To English"
        }
    }
}
