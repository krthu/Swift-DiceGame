//
//  BetGame.swift
//  DiceGame
//
//  Created by Kristian Thun on 2024-04-09.
//

import SwiftUI

struct BetGame: View{
    var goBack: () -> Void
    @ObservedObject var die = Die(type: .six)
    @State var money = 100
    @State var bet: Int = 5
    @State var showResultText = false
    @State var resultText = "Win"
    @State var showSettingsSheet = false
    var stepSize = 5
    @State private var selectedNumber = 0
    let dieImageStrings = ["die.face.1", "die.face.2", "die.face.3", "die.face.4", "die.face.5", "die.face.6"]
    
    
    var body: some View{
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack{
                ZStack{
                    Text("Money: \(money)")
                        .padding()
                    HStack{
                        Spacer()
                        Image(systemName: "gearshape.fill")
                            .padding()
                            .font(.title)
                            .onTapGesture {
                                showSettingsSheet = true
                            }
                    }
                    
                }
              
                
                Text(showResultText ? resultText : " ")
                    .opacity(showResultText ? 1 : 0)
                    .transition(.opacity)
                    .foregroundColor(determineTextColor())
                        
                
        
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
        .sheet(isPresented: $showSettingsSheet ,onDismiss: {
            print("Dismissed")
            }, content: {
                SettingsSheet()
            })
        
    }
    
    func result(){
        
        if die.value == (selectedNumber + 1) {
            money += bet
            resultText = "+\(bet)"
        } else {
            money -= bet
            resultText = "-\(bet)"
        }
            
        
        withAnimation(.easeIn(duration: 0.3)) {
                showResultText = true
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(.easeOut(duration: 0.3)){
                showResultText = false
                
            }
        }
    }
    func determineTextColor() -> Color {
        if die.value == (selectedNumber + 1) {
            return .black
            
        } else {
            return .red
        }
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

struct SettingsSheet: View{
    @State var dice = ["6 sided", "12 sided"]
    @State private var selectedDie = 0
    var body: some View{
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack{
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                List{
                    ChooseDieSection(selectedDie: $selectedDie)
                }
            }
        }
    }
}

struct ChooseDieSection: View{
    @State var dice = ["6 sided", "12 sided"]
    @Binding var selectedDie: Int
    
    var body: some View{
        Section(header: Text("Kind of die")) {
            HStack{
                Picker("Dice", selection: $selectedDie) {
                    ForEach(0..<dice.count, id: \.self) { index in
                        Text("\(dice[index])")
                    }
                }
            }
        }
    }
}



#Preview{
    BetGame(goBack: {}, die: Die(type: .twelve))
}
