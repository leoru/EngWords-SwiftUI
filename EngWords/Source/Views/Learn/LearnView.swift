//
//  LearnView.swift
//  EngWords
//
//  Created by Kirill Kunst on 04.11.2020.
//

import Foundation
import SwiftUI

struct LearnView: View {
    
    @EnvironmentObject var data: DataStore
    @State private var gameType: GameType = .fromEnglish
    
    var body: some View {
        VStack {
            gameTypeSelectorView
            randomGameLink
            categoryLink
        }.navigationBarTitle("Learn", displayMode: .inline)
    }
    
    var gameTypeSelectorView: AnyView {
        return AnyView(
            Picker(selection: $gameType, label: Text("Choose game mode")) {
                ForEach(GameType.allCases, id: \.self) { type in
                    Text(type.title).tag(type)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        )
    }
    
    var randomGameLink: AnyView {
        let game = Game(type: self.gameType, store: self.data, category: nil)
        return AnyView(
            NavigationLink("Random", destination: GameView(game: game))
                .padding()
        )
    }
    
    var categoryLink: AnyView {
        return AnyView(
            NavigationLink("By category", destination: SelectCategoryView(gameType: self.gameType))
                .padding()
        )
    }
}
