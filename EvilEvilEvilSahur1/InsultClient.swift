//
//  InsultClient.swift
//  EvilEvilEvilSahur1
//
//  Created by Student on 5/1/26.
//
import Foundation

@Observable
class InsultClient {
    private(set) var currentInsult: Insult = Insult(insult: "")
    
    func generateInsult() async {
        let randomizerSupremeSahurDiddy5000 = Double.random(in: 0...1)
        let urlStr: String = "https://evilinsult.com/generate_insult.php?lang=en&type=json&r=\(randomizerSupremeSahurDiddy5000)"
        let url: URL? = URL(string: urlStr)
        guard let unwrappedURL = url else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: unwrappedURL)
            let insultResult: Insult = try JSONDecoder().decode(Insult.self, from: data)
            currentInsult = insultResult
        } catch let error {
            print(error)
        }
    }
}


