//
//  Die.swift
//  DiceGame
//
//  Created by Kristian Thun on 2024-04-08.
//

import Foundation

class Die: ObservableObject{
    @Published var value: Int = 1
    let sides: Int
    
    init(sides: Int) {
        self.sides = sides
        roll()
    }
    
    func roll(){
        value = Int.random(in: 1...sides)
    }
    
}
