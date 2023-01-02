//
//  CurrentWeatherExtension.swift
//  Weather Timeline
//
//  Created by Eliot Hertenstein on 12/31/22.
//

import Foundation
import WeatherKit

extension WeatherCondition {
    var isPrecipitation: Bool {
        switch self {
        case .blowingDust, .clear, .cloudy, .foggy, .haze, .mostlyClear, .mostlyCloudy, .partlyCloudy, .smoky, .breezy, .windy, .hot:
            return false
        case .drizzle, .heavyRain, .isolatedThunderstorms, .rain, .sunShowers, .scatteredThunderstorms, .strongStorms, .thunderstorms, .frigid, .hail, .flurries, .sleet, .snow, .sunFlurries, .wintryMix, .blizzard, .blowingSnow, .freezingDrizzle, .freezingRain, .heavySnow, .hurricane, .tropicalStorm:
            return true
        @unknown default:
            fatalError("Unknown weather condition")
        }
    }
}


