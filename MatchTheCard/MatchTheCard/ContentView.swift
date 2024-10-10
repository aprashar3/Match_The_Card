//
//  ContentView.swift
//  MatchTheCard
//
//  Created by Ashish Kumar on 26/06/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["😈","👹","👺","🤡","💩","👻","💀","☠️","👽"]
    @State var cardCount = 4
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardAdjuster
        }.padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90, maximum: 120))]){
            ForEach(0..<cardCount, id: \.self) {index in
                CardView(content: emojis[index])
            }
            .aspectRatio(2/3, contentMode: .fit)
        }
        .foregroundColor(.orange)
    }
    
    var cardAdjuster: some View{
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
    }
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.fill.badge.plus")
        
    }
    
    func cardCountAdjuster(by offset : Int, symbol: String) -> some View{
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
                .imageScale(.large)
                .font(.title)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
}


struct CardView: View {
    let content : String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base =  RoundedRectangle(cornerRadius: 15)
            Group{
                base.fill(.white)
                base.stroke(lineWidth: 1.0)
                Text(content)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            
            
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}




#Preview {
    ContentView()
}

//#Preview {
//    CardView()
//}
