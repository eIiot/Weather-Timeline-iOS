//
//  LocationCard_Loading.swift
//  Weather Timeline
//
//  Created by Eliot Hertenstein on 12/31/22.
//

import SwiftUI

struct LocationCard_Loading: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(spacing: 20) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Berkeley")
                                .fontWeight(.bold)
                                .font(.headline)
                                .foregroundColor(.white)
                            Image(systemName: "location.fill")
                                .fontWeight(.bold)
                                .font(.subheadline)
                                .foregroundColor(.white)
                        }
                        Text("Current Location")
                            .font(.subheadline)
                            .foregroundColor(Color(uiColor: .systemGray4))
                            .fontWeight(.semibold)
                    }
                    Spacer()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                }
                HStack(alignment: .bottom) {
                    Text("__°")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .padding(.bottom, -10)
                        .foregroundColor(.white)
                    Image(systemName: "umbrella.fill")
                        .foregroundColor(.white)
                        .font(.callout)
                        .fontWeight(.semibold)
                    Text("__%")
                        .font(.callout)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                    Spacer()
                    TextWithUnit(text: "7:35", unit: "PM", font: .callout, unitFont: .footnote, color: .white, fontWeight: .semibold)
                }
                
            }
            .padding(.all, 26)
            .background(Color("Rain"))
            .cornerRadius(5)
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
            ZStack {
                Path { path in
                    path.move(to: CGPoint(x: 0, y: 0))
                    path.addLine(to: CGPoint(x: 35, y: 0))
                    path.addLine(to: CGPoint(x: 0, y: 35))
                }
                .fill(Color("Alert"))
                .frame(width: 35, height: 35)
                .cornerRadius(5, corners: [.topLeft])
                Image(systemName: "exclamationmark")
                    .font(.system(size: 12))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .offset(x: -7, y: -7)
                
            }
        }
    }
}

struct LocationCard_Loading_Previews: PreviewProvider {
    static var previews: some View {
        LocationCard_Loading()
    }
}
