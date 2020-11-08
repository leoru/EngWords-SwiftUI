//
//  ListItemGenericModifier.swift
//  EngWords
//
//  Created by Kirill Kunst on 05.11.2020.
//

import Foundation
import SwiftUI

struct ListItemGenericModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(EdgeInsets(top: 15, leading: 20, bottom: 0, trailing: 0))
            .font(.system(size: 18, weight: .bold, design: .default))
    }
}
