//
//  ContentView.swift
//  EvilEvilEvilSahur1
//
//  Created by Student on 4/30/26.
//

import SwiftUI

struct ContentView: View {
    @Environment(InsultClient.self) private var client
    
    var body: some View {
        VStack {
            Text(client.currentInsult.insult)
        }
        .padding()
        .task {
            await client.generateInsult()
        }
    }
}

#Preview {
    ContentView()
        .environment(InsultClient())
}
