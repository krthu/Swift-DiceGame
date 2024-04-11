//
//  PlayerVsPlayer.swift
//  DiceGame
//
//  Created by Kristian Thun on 2024-04-11.
//

import SwiftUI

struct PlayerVsPlayer: View {
    @StateObject var player1Die = Die(type: .six)
    @StateObject var player2Die = Die(type: .six)
    
    var body: some View {
        VStack{
            PlayerView(die: player1Die)
            PlayerView(die: player2Die)
        }
    }
}


struct PlayerView: View{
    @ObservedObject var die: Die
    @State var points = 0
    
    var body: some View{
        VStack{
            HStack{
                Text("Points: \(points)")
            }
            DieView(die: die)
            Button(action: {
                die.roll()
            }, label: {
                Text("Roll")
                    .padding(.horizontal, 15)
                    .padding(.vertical, 5)
                    .background(.blue)
                    .cornerRadius(5)
                    .foregroundColor(.white)
                    
                
            })
            .padding()
            
        }
        .border(.black)
        .padding()
      
        
    }
    
    
}


#Preview {
    PlayerVsPlayer()
}
