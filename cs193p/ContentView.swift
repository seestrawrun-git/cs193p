//
//  ContentView.swift
//  cs193p
//
//  Created by Christopher Strawley on 5/26/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            let emojis: [String] = ["😅", "😩", "🫡", "👄", "👄"]
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])

            }

        }

        .imageScale(.small)
        .padding()
        .foregroundColor(.orange)
    }
}

struct CardView: View {

    let content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            } else {
                base.fill()
                    
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
