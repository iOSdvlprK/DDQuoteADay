//
//  QuoteView.swift
//  DDQuoteADay
//
//  Created by joe on 8/28/25.
//

import SwiftUI

struct QuoteView: View {
    @StateObject var quoteViewModel: QuoteViewModel = .init()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                BigTextView(text: "Quote of the Day")
                
                Spacer()
                
                BigTextView(text: quoteViewModel.quoteModel.content)
                
                Spacer()
                
                BorderedNormalTextView(text: "Tap for Quote")
                    .onTapGesture {
                        quoteViewModel.getRandomQuote()
                    }
            }
            .padding()
        }
    }
}

#Preview {
    QuoteView()
}
