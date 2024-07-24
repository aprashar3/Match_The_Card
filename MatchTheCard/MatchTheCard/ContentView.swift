//
//  ContentView.swift
//  MatchTheCard
//
//  Created by Ashish Kumar on 26/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}


struct CardView: View {
    var isFaceUp = false
    var body: some View {
        ZStack {
            if isFaceUp{
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 1.0)
                Text("👻")
            }else{
                RoundedRectangle(cornerRadius: 15)
            }
            
        }
    }
}




#Preview {
    ContentView()
}

#Preview {
    CardView()
}
