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
    private(set) var responses: [String] = []
    private(set) var currentResponseSubmitted = false
    
    func incrementPlayerCount(change: Int) {
        playerCount += change
        if playerCount < 1 {
            playerCount = 1
        }
    }
    
    func onGameStart() {
        roundStarted = true
    }
    
    func submitResponse(response: String) {
        responses.append(response)
        currentResponseSubmitted = true
    }
    
    func resetResponse() {
        currentResponseSubmitted = false
    }
}
