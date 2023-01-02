//
//  Day_Header.swift
//  Weather Timeline
//
//  Created by Eliot Hertenstein on 12/31/22.
//

import SwiftUI

extension UnitPressure {
    static let mb = UnitPressure(symbol: "mb", converter: UnitConverterLinear(coefficient: 100)) // modify UnitPressure to use a shorter text length for millibars (use mb instead of mbar)
}

struct HeaderCard: View {
    @State var isOpen = false
    
    var icon: AnimatedIcon
    var colorScheme: ColorScheme
    var title: String
    var condition: String
    var temperatures: [Measurement<UnitTemperature>]
    var precipChance: Double
    var precipAmmount: Measurement<UnitLength>
    var windSpeed: Measurement<UnitSpeed>
    var windDirection: String
    var uvIndex: Int
    var uvStrength: String
    var sunEvent: String
    var sunEventTime: String
    var sunEventHour: String
    var moon: String
    var moonType: String
    var humidity: Double
    var dewPoint: Measurement<UnitTemperature>
    var altTemperatures: [Measurement<UnitTemperature>]
    var altTemperatureLabel: String
    var pressure: Measurement<UnitPressure>
    var visibility: Measurement<UnitLength>
    
    var body: some View {
        VStack(spacing: 0) {
                HStack(alignment: .top, spacing: 20) {
                    icon
                    VStack(alignment: .leading) {
                        #warning("TODO: Fix Relative Sizing Here")
                        Text(title)
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        Text(condition)
                            .font(.subheadline)
                            .foregroundColor(colorScheme.captionColor)
                            .fontWeight(.semibold)
                    }
                    Spacer()
                    HStack {
                        ForEach(temperatures, id: \.self) { temperature in
                            Text(temperature.formatted(.measurement(width: .narrow)))
                                .fontWeight(.bold)
                                .font(.title)
                                .foregroundColor(.white)
                        }
                    }.lineLimit(1)
                }
                .padding(.bottom)
                #warning("TODO: Fix column alignment & overflow")
                HStack(alignment: .bottom) {
                    IconStack(icon: Image(systemName: "umbrella.fill"), value: "\(Int(precipChance * 100))%", caption: precipAmmount.formatted(.measurement(width: .abbreviated)), colorScheme: colorScheme)
                    Spacer()
                    #warning("TODO: Fix wind direction")
                    IconStack(icon: Image(systemName: "arrow.up.right"), value: "\(Int(windSpeed.value))", unit: windSpeed.unit.symbol.uppercased(), caption: windDirection, colorScheme: colorScheme)
                    Spacer()
                    IconStack(icon: Image(systemName: "sun.min.fill"), value: "UV \(uvIndex)", caption: uvStrength, colorScheme: colorScheme)
                    Spacer()
                    IconStack(icon: Image(systemName: "sun.and.horizon.fill"), value: sunEventTime, unit: sunEventHour, caption: sunEvent, colorScheme: colorScheme)
                    Spacer()
                    IconStack(icon: Image(systemName: "moonphase.first.quarter.inverse"), value: moon, caption: moonType, colorScheme: colorScheme)
                }
            VStack(spacing: 0) {
                    Divider()
                        .frame(height: 3)
                        .foregroundColor(Color("background"))
                        .padding(.vertical)
                        .padding(10)
                    HStack(alignment: .bottom) {
                        IconStack(icon: Image(systemName: "humidity.fill"), value: "\(Int(humidity * 100))%", caption: "Humidity", colorScheme: colorScheme)
                        Spacer()
                        IconStack(icon: Image(systemName: "drop.fill"), value: dewPoint.formatted(.measurement(width: .narrow)), caption: "Dew Point", colorScheme: colorScheme)
                        Spacer()
                        IconStack(icon: Image(systemName: "thermometer.medium"), value:
                                    altTemperatures.count > 1 ? altTemperatures[0].formatted(.measurement(width: .narrow)) + altTemperatures[1].formatted(.measurement(width: .narrow)) : altTemperatures[0].formatted(.measurement(width: .narrow))
                        , caption: altTemperatureLabel, colorScheme: colorScheme)
                        Spacer()
                        IconStack(icon: Image(systemName: "gauge.high"), value: "\(Int(pressure.value))", unit: pressure.unit.symbol.uppercased(), caption: "Pressure", colorScheme: colorScheme)
                        Spacer()
                        IconStack(icon: Image(systemName: "eye.fill"), value: "\(Int(visibility.value))", unit: visibility.unit.symbol.uppercased(), caption: "Visibility", colorScheme: colorScheme)
                    }
                }
                .frame(height: isOpen ? nil : 0, alignment: .top)
                .clipped()
                
            }
            .padding(.top, 20)
            .padding(.horizontal, 22)
            .padding(.bottom, 24)
            .background(colorScheme.primaryColor)
            .cornerRadius(5)
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
            .onTapGesture {
                withAnimation {
                    isOpen.toggle()
                }
            }
    }
}

struct Day_Header_Previews: PreviewProvider {
    static var colorScheme = ColorScheme(primaryColor: Color("Rain"), textColor: .white, captionColor: Color(uiColor: .systemGray4))
    
    static var previews: some View {
        HeaderCard(icon: AnimatedIcon(icon:"clear_day", width: 38, height: 38), colorScheme: colorScheme, title: "Sunday", condition: "Clear", temperatures: [Measurement(value: 47, unit: .fahrenheit), Measurement(value: 56, unit: .fahrenheit)], precipChance: 0.0, precipAmmount: Measurement(value: 0, unit: .inches), windSpeed: Measurement(value: 14, unit: .milesPerHour), windDirection: "North West", uvIndex: 2, uvStrength: "Low", sunEvent: "Sunset", sunEventTime: "5", sunEventHour: "PM", moon: "First", moonType: "Quarter", humidity: 0.48, dewPoint: Measurement(value: 36, unit: .fahrenheit ), altTemperatures: [Measurement(value: 45, unit: .fahrenheit), Measurement(value: 56, unit: .fahrenheit)], altTemperatureLabel: "Feels Like", pressure: Measurement(value: 1012, unit: .mb), visibility: Measurement(value: 10, unit: .miles))
    }
}
