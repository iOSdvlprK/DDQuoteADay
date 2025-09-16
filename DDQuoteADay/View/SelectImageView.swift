//
//  SelectImageView.swift
//  DDQuoteADay
//
//  Created by joe on 9/16/25.
//

import SwiftUI

struct SelectImageView: View {
    let quote: String
    let author: String
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            Image(img1)
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 20))
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white, lineWidth: 3)
                }
                .padding()
            
            VStack {
                NormalTextView(text: quote)
            }
        }
    }
}

#Preview {
    SelectImageView(quote: "Life is not about having everything. It's about finding meaning in eveything.", author: "Joel Randymar")
}
