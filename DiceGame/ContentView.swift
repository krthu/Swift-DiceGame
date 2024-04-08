//
//  ContentView.swift
//  DiceGame
//
//  Created by Kristian Thun on 2024-04-08.
//

import SwiftUI

struct ContentView: View {
    @StateObject var die = Die(sides: 6)
    
    
    var body: some View {
        ZStack{
            Color(.green)
                .ignoresSafeArea()
            VStack {
                DieView(die: die)
                
                
                Button(action: {
                    die.roll()
                    print("\(die.value)")
                }, label: {
                    Text("Roll")
                })
            }
     
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
    ContentView()
}
