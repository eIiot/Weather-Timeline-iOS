//
//  LocationButton.swift
//  Weather Timeline
//
//  Created by Eliot Hertenstein on 12/30/22.
//

import SwiftUI

struct AlertCard: View {
    var body: some View {
        NavigationLink(destination: EmptyView()) {
            HStack(spacing: 24) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                VStack(alignment: .leading) {
                    Text("Alert for Berkeley")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.headline)
                    Text("Flood Watch")
                        .foregroundColor(Color(uiColor: .systemGray4))
                        .fontWeight(.semibold)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                }
                Spacer()
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 24)
            .background(Color("Alert"))
            .cornerRadius(5)
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
        }
    }
}

struct Alert_Previews: PreviewProvider {
    static var previews: some View {
        AlertCard().preferredColorScheme(.dark)
    }
}
