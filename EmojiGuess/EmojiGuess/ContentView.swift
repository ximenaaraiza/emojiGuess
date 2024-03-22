//
//  ContentView.swift
//  EmojiGuess
//
//  Created by StudentAM on 3/14/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack{
                //inserting image that will be background for homepage
                    Image("bubble")
                     
            //to be able to stack things vertically
                VStack{
                    //displays emoji match
                    Text("EmojiMatch")
                        .frame(width:220 , height:90)
                        .foregroundStyle(Color.pink)
                        .bold()
                        .background(Color.white)
                        .font(.system(size: 30))
                        .cornerRadius(10)
                        .padding(90)
                    // link made to look like button will take you to the game page/ will also make it so the back button doesnt show up after redirected
                    NavigationLink(destination: AfterStart().navigationBarBackButtonHidden(true), label:{
                        Text("Start")
                            .frame(width:100 , height:60)
                            .foregroundStyle(Color.white)
                            .bold()
                            .background(Color.pink)
                            .font(.system(size: 20))
                            .cornerRadius(10)
                            .padding(90)
                    })
                }
                .padding()
            }
        }
        
        
    }
   
}

#Preview {
    ContentView()
}
