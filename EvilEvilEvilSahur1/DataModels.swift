//
//  DataModels.swift
//  EvilEvilEvilSahur1
//
//  Created by Student on 5/1/26.
//
import Foundation

struct Insult: Codable {
    var insult: String
}

struct Response: Identifiable {
    var id: Int
    var content: String
}
