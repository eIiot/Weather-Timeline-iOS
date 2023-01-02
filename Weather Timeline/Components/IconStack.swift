//
//  IconStack.swift
//  Weather Timeline
//
//  Created by Eliot Hertenstein on 12/31/22.
//

import SwiftUI

struct IconStack: View {
    var icon: Image
    var value: String
    var unit: String = ""
    var caption: String
    var colorScheme: ColorScheme
    
    var body: some View {
        VStack(spacing: 3.0) {
            icon
                .foregroundColor(colorScheme.textColor)
                .font(.system(size: 22))
            if unit != "" {
                TextWithUnit(text: value, unit: unit, font: .subheadline, unitFont: .footnote, color: .white, fontWeight: .bold)
            } else {
                Text(value)
                    .font(.subheadline)
                    .foregroundColor(colorScheme.textColor)
                    .fontWeight(.bold)
            }
            Text(caption)
                .font(.footnote)
                .foregroundColor(colorScheme.captionColor)
                .fontWeight(.semibold)
                .lineLimit(1)
                .truncationMode(.tail)
        }
    }
}

struct IconStack_Previews: PreviewProvider {
    static var previews: some View {
        IconStack(icon: Image(systemName: "umbrella.fill"), value: "0%", caption: "0in.", colorScheme: ColorScheme(primaryColor: .black, textColor: .white, captionColor: Color(uiColor: .systemGray4))).preferredColorScheme(.dark)
    }
}
