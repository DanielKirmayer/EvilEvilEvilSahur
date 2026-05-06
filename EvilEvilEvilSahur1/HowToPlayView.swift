//
//  HowToPlayView.swift
//  EvilEvilEvilSahur1
//
//  Created by Student on 5/6/26.
//

import SwiftUI

struct HowToPlayView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                
                Text("How to Play")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Text("Guess the Context is a party game (kinda like Jackbox) where players explain a bizarre reason why someone said something ridiculous. The winner is decided by audience opinion.")
                    .font(.body)
                
                VStack(alignment: .leading, spacing: 35) {
                    HowToPlayStep(
                        number: 1,
                        title: "Get a Prompt",
                        description: "One player receives a wild, out of context insult. Their job is to invent the funniest scenario explaining why someone would've said it."
                    )
                    HowToPlayStep(
                        number: 2,
                        title: "Passing-Play",
                        description: "After submitting their reason the first player passes the device to the next player who receives the same outlandish insult to explain."
                    )
                    
                    HowToPlayStep(
                        number: 3,
                        title: "Delivery",
                        description: "The storytellers each have their explanation delivered to the audience."
                    )
                    
                    
                    HowToPlayStep(
                        number: 4,
                        title: "Winning",
                        description: "Wins are awarded based on an audience majority vote."
                    )
                }
                

                
                Spacer()
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HowToPlayStep: View {
    let number: Int
    let title: String
    let description: String
    
    @State private var animate = false
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Text("\(number)")
                .font(.title)
                .fontWeight(.bold)
                .frame(width: 40, height: 40)
                .background(Color.blue.opacity(0.15))
                .clipShape(Circle())
                .scaleEffect(animate ? 1.1 : 0.8)
                .opacity(animate ? 1 : 0)
                .animation(.spring(duration: 0.6).delay(Double(number) * 0.1), value: animate)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(description)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
        }
        .onAppear {
            animate = true
        }
    }
}


#Preview {
    NavigationStack {
        

        HowToPlayView()
    }
}
