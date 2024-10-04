//
//  ContentView.swift
//  MatchTheCard
//
//  Created by Ashish Kumar on 26/06/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["😈","👹","👺","🤡"]
    var body: some View {
        HStack{
            ForEach(emojis.indices, id: \.self) {index in
                CardView(content: emojis[index])
            }
            
        }
        .foregroundColor(.orange)
        .padding()
    }
}


struct CardView: View {
    let content : String
    @State var isFaceUp = true
    var body: some View {
        ZStack {
            if isFaceUp{
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 1.0)
                Text(content)
            }else{
                RoundedRectangle(cornerRadius: 15)
            }
            
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
