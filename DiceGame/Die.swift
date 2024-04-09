//
//  Die.swift
//  DiceGame
//
//  Created by Kristian Thun on 2024-04-08.
//

import Foundation

class Die: ObservableObject{
    @Published var value: Int = 1
    var sides: Int = 6
    let type: DieType
    
    init(type: DieType) {
        self.type = type
        
        if type == .six {
            self.sides = 6
        } else if type == .twelve{
            self.sides = 12
        }
        roll()
        
        
        //self.sides = sides
        
    }
    
    func roll(){
        value = Int.random(in: 1...sides)
    }
    
}

enum DieType {
    case six, twelve
    
}
