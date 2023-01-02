//
//  CurrentWeatherExtension.swift
//  Weather Timeline
//
//  Created by Eliot Hertenstein on 12/31/22.
//

import Foundation
import WeatherKit

extension WeatherCondition {
    var shortDescription: String {
        switch self {
        case .blowingDust:
            return "Blowing dust."
        case .clear:
            return "Clear."
        case .cloudy:
            return "Cloudy."
        case .foggy:
            return "Fog."
        case .haze:
            return "Haze."
        case .mostlyClear:
            return "Mostly clear."
        case .mostlyCloudy:
            return "Mostly cloudy."
        case .partlyCloudy:
            return "Partly cloudy."
        case .smoky:
            return "Smoky."
        case .breezy:
            return "Breezy, light wind."
        case .windy:
            return "Windy."
        case .drizzle:
            return "Drizzle or light rain."
        case .heavyRain:
            return "Heavy rain."
        case .isolatedThunderstorms:
            return "Isolated thunderstorms."
        case .rain:
            return "Rain."
        case .sunShowers:
            return "Rain with visible sun."
        case .scatteredThunderstorms:
            return "Scattered thunderstorms."
        case .strongStorms:
            return "Strong thunderstorms."
        case .thunderstorms:
            return "Thunderstorms."
        case .frigid:
            return "Frigid conditions"
        case .hail:
            return "Hail."
        case .hot:
            return "High temperatures."
        case .flurries:
            return "Flurries."
        case .sleet:
            return "Sleet."
        case .snow:
            return "Snow."
        case .sunFlurries:
            return "Snow flurries with visible sun."
        case .wintryMix:
            return "Wintry mix."
        case .blizzard:
            return "Blizzard."
        case .blowingSnow:
            return "Blowing or drifting snow."
        case .freezingDrizzle:
            return "Freezing drizzle."
        case .freezingRain:
            return "Freezing rain."
        case .heavySnow:
            return "Heavy snow."
        case .hurricane:
            return "Hurricane."
        case .tropicalStorm:
            return "Tropical storm."
        @unknown default:
            fatalError("Unknown Weather Type??")
        }
    }
}

