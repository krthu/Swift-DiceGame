//
//  DieView.swift
//  DiceGame
//
//  Created by Kristian Thun on 2024-04-09.
//

import SwiftUI

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

