//
//  SelectedResponseView.swift
//  EvilEvilEvilSahur1
//
//  Created by Student on 5/6/26.
//

import SwiftUI

struct SelectedResponseView: View {
    @Environment(\.dismiss) private var dismiss
    
    let response: Response
    let model: GameViewModel
    
    var body: some View {
        VStack {
            Text("Is this the funniest answer?")
                .font(.title)
                .fontWeight(.bold)
            Text("\"\(response.content)\"")
            Button("Confirm") {
                model.onGameEnd(votedResponse: response)
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    SelectedResponseView(response: Response(id: 0, content: "Test Response"), model: GameViewModel())
}
