//
//  ContentView.swift
//  EvilEvilEvilSahur1
//
//  Created by Student on 4/30/26.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                
                Text("Guess the Context")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text("A chaotic party game where you explain why someone said something ridiculous.")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                VStack(spacing: 20) {
                    NavigationLink("Start Game") {
                        GameView()
                    }
                    .buttonStyle(.borderedProminent)
                    .font(.title3)
                    
                    NavigationLink("How to Play") {
                        //HowToPlayView() (All u Big M)
                    }
                    .buttonStyle(.bordered)
                    .font(.title3)
                    
                    NavigationLink("Settings") {
                        //SettingsView() (All u Big M)
                    }
                    .buttonStyle(.bordered)
                    .font(.title3)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}



#Preview {
    ContentView()
        .environment(InsultClient())
        .environment(GameViewModel())
}
