//
//  AnimatedIcon.swift
//  Weather Timeline
//
//  Created by Eliot Hertenstein on 12/30/22.
//

import SwiftUI

struct AnimatedIcon: View {
    var icon: String
    var width: Double = 38
    var height: Double = 38
    
    @State private var currentImageIndex: Int = 0
    
    var body: some View {
        if (iconFrames[icon] != nil) {
            Image("\(icon)_\(String(format: "%02d", currentImageIndex))")
                .resizable()
                .frame(width: width, height: height)
                .fontWeight(.bold)
                .frame(alignment: .bottom)
                .foregroundColor(.white)
                .onAppear {
                    self.currentImageIndex = 0
                }
                .onReceive(Timer.publish(every: 1/30, on: .main, in: .common).autoconnect()) { _ in
                    self.currentImageIndex = (self.currentImageIndex + 1) % Int(iconFrames[icon]!)
                }
        }
    }
}

struct AnimatedIcon_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedIcon(icon: "cloudy", width: 50.0, height: 50.0)
            .preferredColorScheme( .dark)
    }
}
