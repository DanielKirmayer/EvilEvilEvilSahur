//
//  GameView.swift
//  EvilEvilEvilSahur1
//
//  Created by Student on 5/4/26.
//

import SwiftUI

struct GameView: View {
    @Environment(GameViewModel.self) private var model
    @Environment(InsultClient.self) private var client
    
    @State private var currentResponse: String = ""
    
    var body: some View {
        VStack {
            if !model.roundStarted {
                Stepper("Player Count: \(model.playerCount)") {
                    model.incrementPlayerCount(change: 1)
                } onDecrement: {
                    model.incrementPlayerCount(change: -1)
                }
                .fixedSize()
                
                Button("Start") {
                    model.onGameStart()
                }
                .buttonStyle(.borderedProminent)
            }
            else {
                if !model.allResponsesSubmitted {
                    if !model.currentResponseSubmitted {
                        Text("This Round's Insult:\n \(client.currentInsult.insult)")
                        Text("Player \(model.responses.count + 1), enter your response:")
                        TextField(
                            "Enter your response here",
                            text: $currentResponse
                        )
                        .onSubmit {
                            model.submitResponse(response: currentResponse)
                            currentResponse = ""
                        }
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                    }
                    else {
                        Text("Player \(model.responses.count), pass the phone to Player \(model.responses.count + 1).")
                        Text("Press the button when you're done")
                        Button("Continue") {
                            model.resetResponse()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
                else {
                    
                }
            }
        }
        .task {
            await client.generateInsult()
        }
    }
}

#Preview {
    GameView()
        .environment(InsultClient())
        .environment(GameViewModel())
}
