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
            CardView()
            CardView()
            CardView()
            CardView()
        }

        .imageScale(.small)
        .padding()
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("😅")
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
