//
//  DiceButton.swift
//  DiceGame
//
//  Created by Kristian Thun on 2024-04-08.
//

import SwiftUI

struct DiceButtonLabel: View{
    
    var text: String
    var color: UIColor
    var textColor: UIColor
    
    var body: some View{
        Text(text)
            .padding(10)
            .background(Color(color))
            .cornerRadius(10)
            .foregroundColor(Color(textColor))
    }
}

#Preview {
    DiceButtonLabel(text: "Test", color: .green, textColor: .black)
}
