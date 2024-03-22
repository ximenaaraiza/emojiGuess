//
//  PlayAgain.swift
//  EmojiGuess
//
//  Created by StudentAM on 3/20/24.
//

import SwiftUI

struct PlayAgain: View {
    var body: some View {
        ZStack{
            Image("Image")
            VStack{
                Text("🥳")
                    .font(.system(size: 130))
                Text("Great Job!")
                    .font(.system(size: 40))
                //When clicked will lead back to after start to play game again 
                NavigationLink(destination: AfterStart().navigationBarBackButtonHidden(true), label:  {
                    Text("Play Again ")
                        .frame(width:200 , height:60)
                        .foregroundStyle(Color.white)
                        .bold()
                        .background(Color.pink)
                        .font(.system(size: 35))
                        .cornerRadius(10)
                        
                })
            }
        }
        
    }
}

#Preview {
    PlayAgain()
}
