//
//  EmptyStateTextModifier.swift
//  EngWords
//
//  Created by Kirill Kunst on 05.11.2020.
//

import Foundation
import SwiftUI

struct EmptyStateTextModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .font(.system(size: 30, weight: .bold, design: .default))
    }
}
