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
                gameTypeListRow(title: "Ai Game", type: GameType.aiGame, gameType: $gameType)
                gameTypeListRow(title: "Betting Game", type: .betGame, gameType: $gameType)
            }
        }
        else if gameType == .aiGame{
            AiGame(goBack: {
                gameType = .start
                print("GameType is \(gameType)")
            })
        }
        else if gameType == .betGame{
            BetGame {
                gameType = .start
            }
                
        }
        
        
        
    }

}

struct gameTypeListRow: View {
    var title: String
    var type: GameType
    @Binding var gameType: GameType
    var body: some View {
        HStack{
            Text(title)
            Spacer()
            Button(action: {
                gameType = type
            }, label: {
                Image(systemName: "chevron.forward")
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
    case start
    case aiGame
    case betGame

}


#Preview {
    ContentView()
}


