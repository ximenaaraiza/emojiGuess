//
//  AfterStart.swift
//  EmojiGuess
//
//  Created by StudentAM on 3/15/24.
//

import SwiftUI

struct AfterStart: View {
    // array of string of emojis and the shuffle will shuffle the arrsy everytime you play the game
    @State var emojis = ["🐚", "🍓" ,"🫧", "🎀", "🌷", "🐚", "🫀", "🌷", "🍓", "🎀", "🫀", "🫧",].shuffled()
    //adds one to this variale to keep count of matches
    @State var currentScore : Int = 0
    //this will make it known what card was flippe dfor 1 and for 2
    @State var cardOne : Int = -1
    @State var cardTwo : Int = -1
   // a true or false for each emoji
    @State var cardsFlipped : [Bool] = Array(repeating: false, count: 12)
    //settings on how you want the columns to look and be set up
    @State var column : [GridItem] = [
        GridItem(.fixed(90), spacing: nil, alignment: nil),
        GridItem(.fixed(90), spacing: nil, alignment: nil),
        GridItem(.fixed(90), spacing: nil, alignment: nil)
    ]
    var body: some View {
        NavigationView {
            ZStack{
                //background
                Image("Image")
                
                VStack{
                    //will display the current scroe the Int in the variable
                    Text("Current Score:\(currentScore) ")
                        .foregroundStyle(Color.pink)
                        .bold()
                        .font(.system(size: 25))
                        .cornerRadius(10)
                    //will display wha you want in the colomns
                    LazyVGrid(columns: column){
                        //for every single emoji you make a button then when clicked call the function and putting index inside of index to use in the function then the emoji of that index and the bool of that index to the otehr file page to be displayed
                        ForEach(emojis.indices, id: \.self){ index in
                            Button(action: {cardsTapped(index: index)}, label:{
                                cards( emojis: "\(emojis[index])", cardsFlipped: cardsFlipped[index])
                            })
                        }
                    
                    }
                    .padding([.bottom], 20)
                    //the game will be over when theyve reached the max score each match is one so total score will be half of the total count
                    if currentScore == emojis.count/2{
                        HStack{
                            //nav kinks that look like buttons that allow you to end the game, they send you either to the play again page or just reload the game
                            NavigationLink(destination: PlayAgain().navigationBarBackButtonHidden(true), label:  {
                                Text("Next")
                                    .frame(width:100 , height:60)
                                    .foregroundStyle(Color.white)
                                    .bold()
                                    .background(Color.pink)
                                    .font(.system(size: 20))
                                    .cornerRadius(10)
                                   
                                
                            })
                            NavigationLink(destination: AfterStart().navigationBarBackButtonHidden(true), label:  {
                                Text("Retry")
                                    .frame(width:100 , height:60)
                                    .foregroundStyle(Color.white)
                                    .bold()
                                    .background(Color.pink)
                                    .font(.system(size: 20))
                                    .cornerRadius(10)
                                
                            })
                        }
                    }
                }
            }
        }
    }
        
        // function that will be called when a card is tapped
        func cardsTapped(index: Int){
            // will see if card one or two is equal to -1 if it is will go inot forloop
            if cardOne == -1 || cardTwo == -1 {
                //if card one is the one equal to -1 then the if will happen the index of the card clicked will replace -1 so next time around card 1 won't be -1 then will change false to true because this will flip the card over because this will change the array everywhere it is used
                if cardOne == -1 {
                    cardOne = index
                    cardsFlipped[index] = true
                }
                //when the second card is chosen card one will no longer = -1 leading to the else where the second one will now become the index of the second card clickedand make the bool of the same index true to display the emoji
                else{
                    cardTwo = index
                    cardsFlipped[index] = true
                    //after the cards are flipped it will delay the code 1 sec from running so you can see the cards
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                        //after we go into cheching if the emojis are the same if so add one to the score then rest the card to -1 but not the bool so they stayed flipped over
                        if emojis[cardOne] == emojis[cardTwo]{
                            currentScore += 1
                            cardOne = -1
                            cardTwo = -1
                        }
                        // if they arent the same after the delay just reset the bool and card # to re flip and re pick
                        else{
                            cardsFlipped[cardOne] = false
                            cardsFlipped[cardTwo] = false
                            cardOne = -1
                            cardTwo = -1
                        }
                    }
                }
            }
            
        }
    }

    #Preview {
        AfterStart()
    }
    
