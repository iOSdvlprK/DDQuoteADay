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
    var fontSize: CGFloat = 30
    @State private var chosenFont = "Courier New"
    @State private var textOpacity: CGFloat = 1.0
    @State private var textScale: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Image(img1)
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white, lineWidth: 3)
                    )
                    .overlay {
                        CustomNormalTextView(
                            text: quote,
                            chosenFont: chosenFont,
                            fontSize: fontSize
                        )
                        .opacity(textOpacity)
                        .scaleEffect(textScale)
                        .padding()
                        .minimumScaleFactor(0.1)
                    }
                    .padding()
                
                Spacer()
                
                VStack(spacing: 30) {
                    TitledSlider(text: "Scale Text", minValue: 0.1, maxValue: 2.0, step: 0.05, value: $textScale)
                    
                    TitledSlider(text: "Text Opacity", minValue: 0.0, maxValue: 1.0, step: 0.02, value: $textOpacity)
                    
                    SelectFontView(text: "Hello", chosenFont: $chosenFont)
                }
                .padding(.horizontal)
            }
        }
    }
}

struct TitledSlider: View {
    let text: String
    let minValue: CGFloat
    let maxValue: CGFloat
    let step: CGFloat
    @Binding var value: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(text)
                .foregroundStyle(.white)
                .font(.caption)
                .fontWeight(.bold)
                .italic()
            
            Slider(value: $value, in: minValue ... maxValue, step: step)
        }
    }
}

#Preview {
    SelectImageView(quote: "Life is not about having everything. It's about finding meaning in eveything.", author: "Joel Randymar")
}
