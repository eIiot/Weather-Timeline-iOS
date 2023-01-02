//
//  ContentView.swift
//  Weather Timeline
//
//  Created by Eliot Hertenstein on 12/30/22.
//

import SwiftUI
import WeatherKit
import CoreLocation
import CoreLocationUI

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    var weatherService = WeatherService()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
            if let location = locationManager.location {
                LocationCard(weatherService: weatherService, location: CLLocation(latitude: location.latitude, longitude: location.longitude), locationName: "Berkeley", isCurrentLocation: true)
            } else {
                LocationButton {
                    locationManager.requestLocation()
                }
            }
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .top
            )
            .padding()
            .background(
                Color("Background")
            )
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Text("Places")
                            .fontWeight(.semibold)
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                    }.padding(.bottom, 8)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
