//
//  HeadlineTextModifier.swift
//  EngWords
//
//  Created by Kirill Kunst on 05.11.2020.
//

import Foundation
import SwiftUI

struct HeadlineTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.system(.headline)).padding()
    }
}
