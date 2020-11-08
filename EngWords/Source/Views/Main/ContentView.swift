//
//  ContentView.swift
//  EngWords
//
//  Created by Kirill Kunst on 04.11.2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("Categories", destination: CategoriesListView()).padding()
                NavigationLink("Words", destination: WordsListView()).padding()
                NavigationLink("Learn", destination: LearnView()).padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
