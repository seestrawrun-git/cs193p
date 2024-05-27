//
//  ContentView.swift
//  cs193p
//
//  Created by Christopher Strawley on 5/26/24.
//

import SwiftUI

struct ContentView: View {
    
    
    @State var emojis: [String] = ["😅", "😩", "🫡", "👄", "☝️", "😅", "😩", "🫡", "👄", "☝️"]
    @State var cardCount: Int = 4
    
    var body: some View {
        

        VStack {
            title
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjuster
        }
        .padding()
    }
    
    
    var shuffler: some View {
        
        Button(action: {
            emojis.shuffle()
        }, label: {
            Image(systemName: "person.3.fill")
        })
       
        
    }
    
    var title: some View {
        Text("Memorize")
            .font(.largeTitle)
    }
    
    var cardCountAdjuster: some View {
        HStack {
            cardRemover
            Spacer()
            shuffler
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
        
        
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(), GridItem()]){
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
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
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
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
