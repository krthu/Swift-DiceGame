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
    var goBack: () -> Void
    
    
    var body: some View {
        ZStack{
            Color(.green)
                .ignoresSafeArea()
            VStack {
                VStack{
                    Text("Opponent:")
                        .font(.footnote)
                        .foregroundColor(.white)
                    DieView(die: opponentDie)
                       
                    
                }
                Text("\(winnerText)")
                    .font(.headline)
                    .foregroundColor(.white)
                
                VStack{
                    DieView(die: die)
                    
                    Text("You")
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
        winnerText = if die.value < opponentDie.value{
            "You Lost!"
        } else if die.value > opponentDie.value{
            "You Won!"
        } else{
            "Tie!"
        }
    }
}

struct DieView:View {
    let dieImageStrings = [1: "die.face.1", 2: "die.face.2", 3: "die.face.3", 4: "die.face.4", 5: "die.face.5", 6: "die.face.6"]
    @ObservedObject var die: Die
    var body: some View {
        if let imageString = dieImageStrings[die.value]{
            Image(systemName: imageString)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                
        }

    }
    
}



#Preview {
    AiGame(die: Die(sides: 6), goBack:{})
}
