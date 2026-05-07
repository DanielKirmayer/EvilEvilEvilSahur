//
//  GameViewModel.swift
//  EvilEvilEvilSahur1
//
//  Created by Student on 5/4/26.
//

import SwiftUI

@Observable
class GameViewModel {
    private(set) var roundStarted = false
    var allResponsesSubmitted: Bool {
        responses.count == playerCount
    }
    
    private(set) var playerCount = 1
    private(set) var responses: [Response] = []
    private(set) var currentResponseSubmitted = false
    
    private(set) var gameOver = false
    private(set) var winningResponse: Response?
    
    func incrementPlayerCount(change: Int) {
        playerCount += change
        if playerCount < 1 {
            playerCount = 1
        }
    }
    
    func onGameStart() {
        roundStarted = true
    }
    
    func onGameEnd(votedResponse: Response) {
        winningResponse = votedResponse
        gameOver = true
    }
    
    func submitResponse(response: Response) {
        responses.append(response)
        currentResponseSubmitted = true
        
        if allResponsesSubmitted {
            responses.shuffle()
        }
    }
    
    func resetResponse() {
        currentResponseSubmitted = false
    }
}

