//
//  Connector.swift
//  Weather Timeline
//
//  Created by Eliot Hertenstein on 12/30/22.
//

import SwiftUI

struct Connector: View {
    var title: String
    var content: String
    
    @State private var rect: CGRect = CGRect()
    
    var body: some View {
        HStack {
            VStack(spacing: -5) {
                Circle()
                    .stroke(Color("Background"), lineWidth: 8)
                    .overlay(Circle()
                        .fill(.white)
                    )
                    .frame(width: 12, height: 12)
                    .padding(8)
                Rectangle()
                    .fill(.white)
                    .frame(width: 4, height: rect.height + 40)
                    .zIndex(2)
                    .padding(.vertical, -8)
                Circle()
                    .stroke(Color("Background"), lineWidth: 8)
                    .overlay(Circle()
                        .fill(.white)
                    )
                    .frame(width: 12, height: 12)
                    .padding(8)
            }
            .padding(.leading, 28.0)
            .padding(.trailing, 28.0)
            .padding(.top, -28.0)
            .padding(.bottom, -28.0)
            VStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.headline)
                Text(content)
                    .foregroundColor(Color(uiColor: .systemGray4))
                    .fontWeight(.semibold)
                    .font(.footnote)
            }.background(GeometryGetter(rect: $rect))
        }.frame(maxWidth: .infinity, alignment: .leading)
            .zIndex(1)
    }
}

struct Connector_Previews: PreviewProvider {
    static var previews: some View {
        Connector(title: "Next Hour", content: "Light rain").preferredColorScheme(.dark)
    }
}
