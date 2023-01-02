//
//  Next24Hours_Hour.swift
//  Weather Timeline
//
//  Created by Eliot Hertenstein on 12/30/22.
//

import SwiftUI

struct HourCard: View {
    var date: Date
    var showDay: Bool = false
    var conditions: String
    var temp: Measurement<UnitTemperature>
    var description: String
    var icon: AnimatedIcon
    var colorScheme: ColorScheme
    var precipChance: Double
    var precipAmmount: Measurement<UnitLength>
    var windSpeed: Measurement<UnitSpeed>
    var windDirection: String
    var uvIndex: Int
    var uvStrength: String
    var humidity: Double
    var dewPoint: Measurement<UnitTemperature>
    
    @State private var isOpen = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 18) {
                icon
                VStack(alignment: .leading) {
                    HStack {
                        HStack(alignment: .bottom, spacing: 0) {
                            Text(date.fromDateFormatter("h"))
                                .font(.headline)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                            Text(date.fromDateFormatter("a"))
                                .font(.headline)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                            if showDay {
                                Text(" (\(date.formattedWeekday()))")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            }
                        }.lineLimit(1)
                        Spacer()
                        Text(temp.formatted(.measurement(width: .narrow)))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.headline)
                    }
                    HStack {
                        Text(conditions)
                            .foregroundColor(colorScheme.captionColor)
                            .fontWeight(.semibold)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        Spacer()
                        Text(description)
                            .foregroundColor(colorScheme.captionColor)
                            .fontWeight(.semibold)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
            HStack(alignment: .bottom) {
                IconStack(icon: Image(systemName: "umbrella.fill"), value: "\(Int(precipChance * 100))%", caption: precipAmmount.formatted(.measurement(width: .abbreviated)), colorScheme: colorScheme)
                Spacer()
                IconStack(icon: Image(systemName: "arrow.up.right"), value: "\(Int(windSpeed.value))", unit: windSpeed.unit.symbol.uppercased(), caption: windDirection, colorScheme: colorScheme)
                Spacer()
                IconStack(icon: Image(systemName: "sun.min.fill"), value: "UV \(uvIndex)", caption: uvStrength, colorScheme: colorScheme)
                Spacer()
                IconStack(icon: Image(systemName: "humidity.fill"), value: "\(Int(humidity * 100))%", caption: "Humidity", colorScheme: colorScheme)
                Spacer()
                IconStack(icon: Image(systemName: "drop.fill"), value: dewPoint.formatted(.measurement(width: .narrow)), caption: "Dew Point", colorScheme: colorScheme)
            }
            .padding(.top, 16)
            .frame(height: isOpen ? nil : 0, alignment: .top)
            .clipped()
        }
        .padding(.vertical, 18)
        .padding(.horizontal, 18)
        .background(colorScheme.primaryColor)
        .onTapGesture {
            withAnimation {
                isOpen.toggle()
            }
        }
    }
}

struct HourCard_Previews: PreviewProvider {
    static var previews: some View {
        HourCard(date: Date(), conditions: "Light rain", temp: Measurement(value: 56, unit: .fahrenheit), description: "94% Rain - Feels 55°", icon: AnimatedIcon(icon: "rain"), colorScheme: ColorScheme(primaryColor: Color("Rain"), textColor: .white, captionColor: Color(uiColor: .systemGray)), precipChance: 0.94, precipAmmount: Measurement(value: 0, unit: .inches), windSpeed: Measurement(value: 12, unit: .milesPerHour), windDirection: "South West", uvIndex: 0, uvStrength: "Low", humidity: 0.96, dewPoint: Measurement(value: 54, unit: .fahrenheit))
            .previewLayout(.sizeThatFits)
    }
}
