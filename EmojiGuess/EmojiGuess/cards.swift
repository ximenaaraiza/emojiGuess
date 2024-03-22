//
//  cards.swift
//  EmojiGuess
//
//  Created by StudentAM on 3/19/24.
//

import SwiftUI

struct cards: View {
    var emojis : String
    var cardsFlipped : Bool
    var body: some View {
     
        ZStack{
            Circle()
                .fill(cardsFlipped == true ? Color(UIColor.clear) : Color.white)
                .frame(width: 70, height: 70)
            if cardsFlipped == true{
                Text("\(emojis)")
            }
        }
    }
}

#Preview {
    cards( emojis: "🐚", cardsFlipped: true)
}

