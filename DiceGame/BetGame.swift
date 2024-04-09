//
//  BetGame.swift
//  DiceGame
//
//  Created by Kristian Thun on 2024-04-09.
//

import SwiftUI

struct BetGame: View{
    var goBack: () -> Void
    @ObservedObject var die = Die(sides: 6)
    @State var money = 100
    @State var bet: Int = 5
    var stepSize = 5
    @State private var selectedNumber = 0
    let dieImageStrings = ["die.face.1", "die.face.2", "die.face.3", "die.face.4", "die.face.5", "die.face.6"]
    
    
    var body: some View{
        ZStack{
            Color.green
                .ignoresSafeArea()
            VStack{
        
                Text("Money: \(money)")
                    .padding()
        
                VStack{
                    HStack{
                        DieView(die: die)
                    }
//                    Text("Player: ")
//                        .font(.caption)
                    HStack{
                        Stepper("Bet: \(bet)", value: $bet, in: 5...money, step: stepSize)
                            //.padding([.leading, .trailing], 50)
                            .frame(width: 200)
                    }
                    
                    betPicker(selected: $selectedNumber, dieImageStrings: dieImageStrings)
                        .padding(.vertical, 20)
                    
                    Button(action: {
                        die.roll()
                        print("\(selectedNumber)")
                        result()
                        
                    }, label: {
                        DiceButtonLabel(text: "Roll", color: .purple, textColor: .white)
                            
                    })
                    .padding()
                    
                }
                Spacer()
            }
            
        }
        
        
        
        
    }
    
    func result(){
        die.value == (selectedNumber + 1) ? (money += bet) : (money -= bet)
    }
    
}

struct betPicker: View {
    @Binding var selected: Int
    let dieImageStrings: [String]
    
    var body: some View{
        VStack{
            Text("What will you roll?")
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Picker("BetPicker", selection: $selected) {
                ForEach(0..<dieImageStrings.count, id: \.self) { index in
                    Image(systemName: dieImageStrings[index])
                        .tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
        }
        .padding(.horizontal, 20)
    }
}



#Preview{
    BetGame(goBack: {}, die: Die(sides: 6))
}
