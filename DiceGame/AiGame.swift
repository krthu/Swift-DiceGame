//
//  File.swift
//  DiceGame
//
//  Created by Kristian Thun on 2024-04-08.
//

import SwiftUI

struct AiGame: View {
    @StateObject var die = Die(sides: 6)
    @StateObject var opponentDie = Die(sides: 6)
    @State var winnerText = "Roll to see who gets the highest!"
    @State var playerScore = 0
    @State var aiScore = 0
    var goBack: () -> Void
    
    
    var body: some View {
        ZStack{
            Color(.green)
                .ignoresSafeArea()
            VStack {
                VStack{
                    Text("Opponent: \(aiScore)")
                        .font(.footnote)
                        .foregroundColor(.white)
                    DieView(die: opponentDie)
                       
                    
                }
                Text("\(winnerText)")
                    .font(.headline)
                    .foregroundColor(.white)
                
                VStack{
                    DieView(die: die)
                    
                    Text("You: \(playerScore)")
                        .font(.footnote)
                        .foregroundColor(.white)
                }
                HStack{
                    Button(action: {
                        goBack()
                    }, label: {
                        DiceButtonLabel(text: "End Game", color: .red, textColor: .white)
    
                    })

                    
                    
                
                    Spacer()
                    Button(action: {
                        die.roll()
                        opponentDie.roll()
                        decideWinner()
                    }, label: {
                        DiceButtonLabel(text: "Roll", color: .purple, textColor: .white)
                        
                    })
                  
                    
                }
                .padding()
            }
        }

    }
    func decideWinner(){
        if die.value < opponentDie.value{
            winnerText = "You Lost!"
            aiScore += 1
        } else if die.value > opponentDie.value{
            winnerText = "You Won!"
            playerScore += 1
        } else{
            winnerText =  "Tie!"
        }
    }
}




#Preview {
    AiGame(die: Die(sides: 6), goBack:{})
}
