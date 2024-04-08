//
//  ContentView.swift
//  DiceGame
//
//  Created by Kristian Thun on 2024-04-08.
//

import SwiftUI

struct ContentView: View {
    @State var gameType: GameType = .start
    
    
    var body: some View {
        if gameType == .start{
            List{
                HStack{
                    Text("Ai game")
                    Spacer()
                    Button(action: {
                        gameType = .aiGame
                    }, label: {
                        Image(systemName: "chevron.forward")
                    })
                }
            }
        }
        else if gameType == .aiGame{
            AiGame(goBack: {
                gameType = .start
                print("GameType is \(gameType)")
            })
        }
    }

}

//struct DieView:View {
//    let dieImageStrings = [1: "die.face.1", 2: "die.face.2", 3: "die.face.3", 4: "die.face.4", 5: "die.face.5", 6: "die.face.6"]
//    @ObservedObject var die: Die
//    var body: some View {
//        if let imageString = dieImageStrings[die.value]{
//            Image(systemName: imageString)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .padding()
//        }
//
//    }
//    
//}

enum GameType{
    case aiGame
    case start
}


#Preview {
    ContentView()
}
