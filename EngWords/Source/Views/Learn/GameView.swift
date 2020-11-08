//
//  GameView.swift
//  EngWords
//
//  Created by Kirill Kunst on 04.11.2020.
//

import Foundation
import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var data: DataStore
    
    @State private var word: Word?
    @State private var wordState: WordResultState = .none
    @State private var answer: String = ""
    private var game: Game
    
    //MARK: - Calculated vars
    
    private var resultColor: Color {
        return self.wordState == .success ? Color.green : Color.red
    }
    
    private var resultText: String {
        self.wordState == .success ? "Correct" : "Incorrect"
    }

    init(game: Game) {
        self.game = game
    }
    
    //MARK: - UI
    
    var body: some View {
        VStack {
            if self.word != nil {
                wordView
            } else {
                emptyStateView
            }
            Spacer()
        }
        .navigationBarTitle(self.game.title, displayMode: .inline)
        .onAppear { self.queueNext() }
    }
    
    var wordView: AnyView {
        return AnyView(
            Group {
                Text(self.game.textToTranslate(for: self.word!)).modifier(HeadlineTextModifier())
                TextField("Enter translation", text: $answer).multilineTextAlignment(.center).padding()

                Button("Check") {
                    self.check()
                }
                .padding()
                .disabled(answer.isEmpty)
                
                resultView
            }
        )
    }
    
    var resultView: AnyView {
        if self.wordState == .none {
            return AnyView(Spacer())
        }
        
        return AnyView(
            Text(self.resultText)
                .modifier(GameResultTextModifier(color: self.resultColor))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.queueNext()
                    }
                }
        )
    }
    
    var emptyStateView: AnyView {
        return AnyView(
            Group {
                Spacer()
                Text("No words").padding()
                Spacer()
            }
        )
    }
    
    //MARK: - Actions
    
    private func check() {
        let result = self.game.check(word: self.word!, input: self.answer)
        
        self.wordState = result ? .success : .fail
    }
    
    private func queueNext() {
        self.wordState = .none
        self.answer = ""
        self.word = self.game.nextWord()
    }
}
