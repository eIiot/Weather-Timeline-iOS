//
//  TextWithUnit.swift
//  Weather Timeline
//
//  Created by Eliot Hertenstein on 12/31/22.
//

import SwiftUI

struct TextWithUnit: View {
    var text: String
    var unit: String
    var font: Font
    var unitFont: Font
    var color: Color
    var fontWeight: Font.Weight
    
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            Text(text)
                .font(font)
                .foregroundColor(color)
                .fontWeight(fontWeight)
            Text(unit)
                .font(unitFont)
                .foregroundColor(color)
                .fontWeight(fontWeight)
        }.lineLimit(1)
    }
}

struct TextWithUnit_Previews: PreviewProvider {
    static var previews: some View {
        TextWithUnit(text: "16", unit: "MPH", font: .subheadline, unitFont: .footnote, color: .white, fontWeight: .bold).preferredColorScheme(.dark)
    }
}
