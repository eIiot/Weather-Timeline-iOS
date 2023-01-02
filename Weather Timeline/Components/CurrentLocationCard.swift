//
//  LocationButton.swift
//  Weather Timeline
//
//  Created by Eliot Hertenstein on 12/30/22.
//

import SwiftUI
import WeatherKit
import CoreLocation
import CoreLocationUI

extension Date {

    // Convert local time to UTC (or GMT)
    func toGlobalTime() -> Date {
        let timezone = TimeZone.current
        let seconds = -TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }

    // Convert UTC (or GMT) to local time
    func toLocalTime() -> Date {
        let timezone = TimeZone.current
        let seconds = TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }
    
    func formattedTime() -> String {
        let formattedDateTime = self.formatted(.dateTime.hour().minute())
            
        return formattedDateTime.components(separatedBy: " ").first ?? ""
    }
    
    func formattedAmPm() -> String {
        let formattedDateTime = self.formatted(.dateTime.hour().minute())
            
        return formattedDateTime.components(separatedBy: " ").last ?? ""
    }

}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}


struct LocationCard: View {
    var weatherService: WeatherService
    @State var weather: Weather?
    
    var location: CLLocation
    
    var body: some View {
            if let weather = weather  {
                NavigationLink(destination: TimelineView(weather: weather)) {
                    ZStack(alignment: .topLeading) {
                        VStack {
                            HStack(alignment: .top) {
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text("Berkeley")
                                            .fontWeight(.bold)
                                            .font(.headline)
                                            .foregroundColor(weather.currentWeather.colorScheme.textColor)
                                        Image(systemName: "location.fill")
                                            .fontWeight(.bold)
                                            .font(.subheadline)
                                            .foregroundColor(weather.currentWeather.colorScheme.textColor)
                                    }
                                    Text("Current Location")
                                        .font(.subheadline)
                                        .foregroundColor(weather.currentWeather.colorScheme.captionColor)
                                        .fontWeight(.semibold)
                                }
                                Spacer()
                                weather.currentWeather.animatedIcon
                            }
                            HStack(alignment: .bottom) {
                                Text(weather.currentWeather.temperature.formatted())
                                    .fontWeight(.bold)
                                    .font(.largeTitle)
                                    .padding(.bottom, -10)
                                    .foregroundColor(weather.currentWeather.colorScheme.textColor)
                                Image(systemName: "umbrella.fill")
                                    .foregroundColor(weather.currentWeather.colorScheme.textColor)
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                Text(weather.currentWeather.condition.rawValue)
                                    .font(.callout)
                                    .foregroundColor(weather.currentWeather.colorScheme.textColor)
                                    .fontWeight(.semibold)
                                Spacer()
                                TextWithUnit(text: weather.currentWeather.date.formattedTime(), unit: weather.currentWeather.date.formattedAmPm(), font: .callout, unitFont: .footnote, color: .white, fontWeight: .semibold)
                            }
                            
                        }
                        .padding(.all, 26)
                        .background(weather.currentWeather.colorScheme.primaryColor)
                        .cornerRadius(5)
                        .frame(
                            maxWidth: .infinity,
                            alignment: .leading
                        )
                        if (weather.weatherAlerts ?? []).count > 0 {
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
            } else {
                LocationCard_Loading()
                    .task {
                        do {
                            weather = try await
                            weatherService.weather(for: location)
                        } catch {
                            print("Error getting weather: \(error)")
                        }
                    }
            }
    }
}

//struct CurrentLocationCard_Previews: PreviewProvider {
//    static let locationManager = LocationManager()
//
//    static var previews: some View {
//        CurrentLocationCard(weatherManager: WeatherManager()).preferredColorScheme(.dark)
//            .environmentObject(locationManager)
//    }
//}
