//
//  EmptyStateView.swift
//  EngWords
//
//  Created by Kirill Kunst on 05.11.2020.
//

import Foundation
import SwiftUI

struct EmptyStateView: View {
    
    let text: String
 
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "tray").resizable().scaledToFit().frame(height: 60)
            HStack {
                Spacer()
                Text(self.text)
                    .modifier(EmptyStateTextModifier())
                Spacer()
            }
            Spacer()
        }.opacity(0.6)
    }
}
