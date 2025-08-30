//
//  QuoteView.swift
//  DDQuoteADay
//
//  Created by joe on 8/28/25.
//

import SwiftUI

struct QuoteView: View {
    @State private var quote: String = "temporary quote"
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                BigTextView(text: "Quote of the Day")
                
                Spacer()
                
                BigTextView(text: quote)
                
                Spacer()
                
                BorderedNormalTextView(text: "Tap for Quote")
                    .onTapGesture {
                        quote = "Life is not about having everything. It's about finding meaning in eveything."
                    }
            }
            .padding()
        }
    }
}

#Preview {
    QuoteView()
}
