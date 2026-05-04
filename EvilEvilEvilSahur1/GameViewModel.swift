//
//  GameViewModel.swift
//  EvilEvilEvilSahur1
//
//  Created by Student on 5/4/26.
//

import SwiftUI

@Observable
class GameViewModel {
    var insultClient = InsultClient()
    var round = GameRound()
    var playerInput: String = ""
    
    func startNewRound() async {
        await insultClient.generateInsult()
        round.insult = insultClient.currentInsult.insult
        round.explanations = []
    }
    
    func submitExplanation() {
        guard !playerInput.isEmpty else { return }
        round.explanations.append(Explanation(text: playerInput))
        playerInput = ""
    }
}

struct Explanation: Identifiable {
    let id = UUID()
    var text: String
}

@Observable
class GameRound {
    var insult: String = ""
    var explanations: [Explanation] = []
}
