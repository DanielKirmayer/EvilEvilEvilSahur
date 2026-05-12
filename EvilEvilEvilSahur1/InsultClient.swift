//
//  InsultClient.swift
//  EvilEvilEvilSahur1
//
//  Created by Student on 5/1/26.
//
import Foundation
import UIKit

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
            currentInsult.insult = currentInsult.insult.decodingHTMLEntities
        } catch let error {
            print(error)
        }
    }
}

extension String {
    var decodingHTMLEntities: String {
        guard let data = self.data(using: .utf8) else { return self }
        
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        if let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) {
            return attributedString.string
        }
        return self
    }
}
