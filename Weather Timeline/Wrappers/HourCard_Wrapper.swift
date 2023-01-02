//
//  HourCard_Wrapper.swift
//  Weather Timeline
//
//  Created by Eliot Hertenstein on 1/1/23.
//

import SwiftUI
import WeatherKit

struct HourCard_Wrapper: View {
    let hour: HourWeather
    
    var body: some View {
        HourCard(date: hour.date,
                 showDay: true,
                 conditions: hour.condition.description,
                 temp: hour.apparentTemperature,
                 description: (hour.precipitationChance > 0.3 ? "\(Int(hour.precipitationChance * 100))% \(hour.condition.description) -" : "") + "Actual \(hour.temperature.formatted(.measurement(width: .narrow)))",
                 icon: hour.animatedIcon,
                 colorScheme: hour.colorScheme,
                 precipChance: hour.precipitationChance,
                 precipAmmount: hour.precipitationAmount,
                 windSpeed: hour.wind.speed,
                 windDirection: hour.wind.compassDirection.description,
                 uvIndex: hour.uvIndex.value,
                 uvStrength: hour.uvIndex.category.description,
                 humidity: hour.humidity,
                 dewPoint: hour.dewPoint
        )
    }
}
