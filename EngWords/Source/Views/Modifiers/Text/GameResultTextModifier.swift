//
//  GameResultTextModifier.swift
//  EngWords
//
//  Created by Kirill Kunst on 05.11.2020.
//

import Foundation
import SwiftUI

struct GameResultTextModifier: ViewModifier {
    
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(color)
            .transition(.asymmetric(insertion: .scale, removal: .opacity))
            .animation(.easeIn)
            .padding()
    }
}
