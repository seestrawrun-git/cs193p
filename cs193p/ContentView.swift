//
//  ContentView.swift
//  cs193p
//
//  Created by Christopher Strawley on 5/26/24.
//

import SwiftUI

struct ContentView: View {
    
    let emojis: [String] = ["😅", "😩", "🫡", "👄", "☝️", "😅", "😩", "🫡", "👄", "☝️"]
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            cards
            cardCountAdjuster
        }
        .padding()
    }
    
    
    
    var cardCountAdjuster: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
        
        
    }
    
    var cards: some View {
            HStack{
                ForEach(0..<cardCount, id: \.self) { index in
                    CardView(content: emojis[index])}
            }
            .foregroundColor(.orange)
        
    }
    
    func cardCountAdjustment(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount+=offset
        }, label: {
            Image(systemName: symbol)
        }
            )
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
        
    }
    
    
    var cardRemover: some View {
        return cardCountAdjustment(by: -1, symbol: "rectangle.stack.badge.minus")
    }
    
    var cardAdder: some View {
        return cardCountAdjustment(by: 1, symbol: "rectangle.stack.badge.plus")
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
