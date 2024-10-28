//
//  ContentView.swift
//  MatchTheCard
//
//  Created by Ashish Kumar on 26/06/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    let memoryGameModel = EmojiMemoryGame()
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
        }.padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90, maximum: 120))]){
            ForEach(memoryGameModel.cards.indices, id: \.self) {index in
                CardView(card: memoryGameModel.cards[index])
            }
            .aspectRatio(2/3, contentMode: .fit)
        }
        .foregroundColor(.orange)
    }
}


struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let base =  RoundedRectangle(cornerRadius: 15)
            Group{
                base.fill(.white)
                base.stroke(lineWidth: 1.0)
                Text(card.content)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
            
            
        }
    }
}




#Preview {
    EmojiMemoryGameView()
}

//#Preview {
//    CardView()
//}
