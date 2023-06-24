//
//  ContentView.swift
//  CombineWithAlamofire
//
//  Copyright (c) 2023 oasis444. All right reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var randomUserViewModel = RandomUserViewModel()
    
    var body: some View {
        List(randomUserViewModel.randomUsers) { randomUser in
            RandomUserRow(randomUser)
        }
        .listStyle(.plain)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
