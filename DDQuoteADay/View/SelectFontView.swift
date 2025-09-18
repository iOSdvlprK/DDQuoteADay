//
//  SelectFontView.swift
//  DDQuoteADay
//
//  Created by joe on 9/17/25.
//

import SwiftUI

struct SelectFontView: View {
    let fontList: [String] = [
        "Courier New", "Pacifico-Regular", "Molle-Regular", "GreatVibes-Regular", "Sacramento-Regular", "DancingScript-SemiBold", "ButterflyKids-Regular", "GoblinOne", "ChalkboardSE-Bold", "Limelight-Regular", "ShadowsIntoLightTwo-Regular"
    ]
    let text: String
    @Binding var chosenFont: String
    let textFontSizeConst: CGFloat = 24
    @State private var color: Color = .blue
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(fontList, id: \.self) { font in
                    Text(text)
                        .font(Font.custom(font, size: font == chosenFont ? 1.5 * textFontSizeConst : textFontSizeConst))
                        .padding(.horizontal)
                        .animation(.spring(), value: chosenFont)
                        .onTapGesture {
                            chosenFont = font
                            color = randomColor()
                        }
                }
            }
            .padding()
            .background(color.opacity(0.7))
        }
    }
    
    func randomColor() -> Color {
        let colorList: [Color] = [
            .blue, .purple, .pink, .red, .green, .brown
        ]
        let index = Int.random(in: 0 ..< colorList.count)
        return colorList[index]
    }
}

#Preview {
    SelectFontView(text: "Hello", chosenFont: .constant("Courier New"))
}
