//
//  IconScheme.swift
//  Weather Timeline
//
//  Created by Eliot Hertenstein on 12/31/22.
//

import Foundation
import WeatherKit

extension CurrentWeather {
    var animatedIcon: AnimatedIcon {
        switch self.condition {
        case .blowingDust:
            return AnimatedIcon(icon: "wind")
        case .clear:
            return self.isDaylight ? AnimatedIcon(icon: "clear_day") : AnimatedIcon(icon: "clear_night")
        case .cloudy:
            return AnimatedIcon(icon: "cloudy")
        case .foggy:
            return AnimatedIcon(icon: "fog")
        case .haze:
            return AnimatedIcon(icon: "fog")
        case .mostlyClear:
            return self.isDaylight ? AnimatedIcon(icon: "partly_cloudy_day") : AnimatedIcon(icon: "partly_cloudy_night")
        case .mostlyCloudy:
            return AnimatedIcon(icon: "cloudy")
        case .partlyCloudy:
            return self.isDaylight ? AnimatedIcon(icon: "partly_cloudy_day") : AnimatedIcon(icon: "partly_cloudy_night")
        case .smoky:
            return AnimatedIcon(icon: "fog")
        case .breezy:
            return AnimatedIcon(icon: "wind")
        case .windy:
            return AnimatedIcon(icon: "wind")
        case .drizzle:
            return AnimatedIcon(icon: "rain")
        case .heavyRain:
            return AnimatedIcon(icon: "rain")
        case .isolatedThunderstorms:
            return AnimatedIcon(icon: "thunderstorm")
        case .rain:
            return AnimatedIcon(icon: "rain")
        case .sunShowers:
            return AnimatedIcon(icon: "rain")
        case .scatteredThunderstorms:
            return AnimatedIcon(icon: "thunderstorm")
        case .strongStorms:
            return AnimatedIcon(icon: "thunderstorm")
        case .thunderstorms:
            return AnimatedIcon(icon: "thunderstorm")
        case .frigid:
            return AnimatedIcon(icon: "snow")
        case .hail:
            return AnimatedIcon(icon: "snow")
        case .hot:
            return self.isDaylight ? AnimatedIcon(icon: "clear_day") : AnimatedIcon(icon: "clear_night")
        case .flurries:
            return AnimatedIcon(icon: "snow")
        case .sleet:
            return AnimatedIcon(icon: "sleet")
        case .snow:
            return AnimatedIcon(icon: "snow")
        case .sunFlurries:
            return AnimatedIcon(icon: "snow")
        case .wintryMix:
            return AnimatedIcon(icon: "sleet")
        case .blizzard:
            return AnimatedIcon(icon: "snow")
        case .blowingSnow:
            return AnimatedIcon(icon: "snow")
        case .freezingDrizzle:
            return AnimatedIcon(icon: "sleet")
        case .freezingRain:
            return AnimatedIcon(icon: "sleet")
        case .heavySnow:
            return AnimatedIcon(icon: "snow")
        case .hurricane:
            return AnimatedIcon(icon: "thunderstorm")
        case .tropicalStorm:
            return AnimatedIcon(icon: "thunderstorm")
        default:
            return self.isDaylight ? AnimatedIcon(icon: "clear_day") : AnimatedIcon(icon: "clear_night")
        }
    }
}

extension HourWeather {
    var animatedIcon: AnimatedIcon {
        switch self.condition {
        case .blowingDust:
            return AnimatedIcon(icon: "wind")
        case .clear:
            return self.isDaylight ? AnimatedIcon(icon: "clear_day") : AnimatedIcon(icon: "clear_night")
        case .cloudy:
            return AnimatedIcon(icon: "cloudy")
        case .foggy:
            return AnimatedIcon(icon: "fog")
        case .haze:
            return AnimatedIcon(icon: "fog")
        case .mostlyClear:
            return self.isDaylight ? AnimatedIcon(icon: "partly_cloudy_day") : AnimatedIcon(icon: "partly_cloudy_night")
        case .mostlyCloudy:
            return AnimatedIcon(icon: "cloudy")
        case .partlyCloudy:
            return self.isDaylight ? AnimatedIcon(icon: "partly_cloudy_day") : AnimatedIcon(icon: "partly_cloudy_night")
        case .smoky:
            return AnimatedIcon(icon: "fog")
        case .breezy:
            return AnimatedIcon(icon: "wind")
        case .windy:
            return AnimatedIcon(icon: "wind")
        case .drizzle:
            return AnimatedIcon(icon: "rain")
        case .heavyRain:
            return AnimatedIcon(icon: "rain")
        case .isolatedThunderstorms:
            return AnimatedIcon(icon: "thunderstorm")
        case .rain:
            return AnimatedIcon(icon: "rain")
        case .sunShowers:
            return AnimatedIcon(icon: "rain")
        case .scatteredThunderstorms:
            return AnimatedIcon(icon: "thunderstorm")
        case .strongStorms:
            return AnimatedIcon(icon: "thunderstorm")
        case .thunderstorms:
            return AnimatedIcon(icon: "thunderstorm")
        case .frigid:
            return AnimatedIcon(icon: "snow")
        case .hail:
            return AnimatedIcon(icon: "snow")
        case .hot:
            return self.isDaylight ? AnimatedIcon(icon: "clear_day") : AnimatedIcon(icon: "clear_night")
        case .flurries:
            return AnimatedIcon(icon: "snow")
        case .sleet:
            return AnimatedIcon(icon: "sleet")
        case .snow:
            return AnimatedIcon(icon: "snow")
        case .sunFlurries:
            return AnimatedIcon(icon: "snow")
        case .wintryMix:
            return AnimatedIcon(icon: "sleet")
        case .blizzard:
            return AnimatedIcon(icon: "snow")
        case .blowingSnow:
            return AnimatedIcon(icon: "snow")
        case .freezingDrizzle:
            return AnimatedIcon(icon: "sleet")
        case .freezingRain:
            return AnimatedIcon(icon: "sleet")
        case .heavySnow:
            return AnimatedIcon(icon: "snow")
        case .hurricane:
            return AnimatedIcon(icon: "thunderstorm")
        case .tropicalStorm:
            return AnimatedIcon(icon: "thunderstorm")
        default:
            return self.isDaylight ? AnimatedIcon(icon: "clear_day") : AnimatedIcon(icon: "clear_night")
        }
    }
}

extension WeatherCondition {
    
    /// Returns the Animated Icon for the current condition, without daylight data.
    /// Useful when `parent.animatedIcon` isn't available (like for `DayWeather`)
    var animatedIcon: AnimatedIcon {
        switch self {
        case .blowingDust:
            return AnimatedIcon(icon: "wind")
        case .clear:
            return AnimatedIcon(icon: "clear_day")
        case .cloudy:
            return AnimatedIcon(icon: "cloudy")
        case .foggy:
            return AnimatedIcon(icon: "fog")
        case .haze:
            return AnimatedIcon(icon: "fog")
        case .mostlyClear:
            return AnimatedIcon(icon: "partly_cloudy_day")
        case .mostlyCloudy:
            return AnimatedIcon(icon: "cloudy")
        case .partlyCloudy:
            return  AnimatedIcon(icon: "partly_cloudy_day")
        case .smoky:
            return AnimatedIcon(icon: "fog")
        case .breezy:
            return AnimatedIcon(icon: "wind")
        case .windy:
            return AnimatedIcon(icon: "wind")
        case .drizzle:
            return AnimatedIcon(icon: "rain")
        case .heavyRain:
            return AnimatedIcon(icon: "rain")
        case .isolatedThunderstorms:
            return AnimatedIcon(icon: "thunderstorm")
        case .rain:
            return AnimatedIcon(icon: "rain")
        case .sunShowers:
            return AnimatedIcon(icon: "rain")
        case .scatteredThunderstorms:
            return AnimatedIcon(icon: "thunderstorm")
        case .strongStorms:
            return AnimatedIcon(icon: "thunderstorm")
        case .thunderstorms:
            return AnimatedIcon(icon: "thunderstorm")
        case .frigid:
            return AnimatedIcon(icon: "snow")
        case .hail:
            return AnimatedIcon(icon: "snow")
        case .hot:
            return AnimatedIcon(icon: "clear_day")
        case .flurries:
            return AnimatedIcon(icon: "snow")
        case .sleet:
            return AnimatedIcon(icon: "sleet")
        case .snow:
            return AnimatedIcon(icon: "snow")
        case .sunFlurries:
            return AnimatedIcon(icon: "snow")
        case .wintryMix:
            return AnimatedIcon(icon: "sleet")
        case .blizzard:
            return AnimatedIcon(icon: "snow")
        case .blowingSnow:
            return AnimatedIcon(icon: "snow")
        case .freezingDrizzle:
            return AnimatedIcon(icon: "sleet")
        case .freezingRain:
            return AnimatedIcon(icon: "sleet")
        case .heavySnow:
            return AnimatedIcon(icon: "snow")
        case .hurricane:
            return AnimatedIcon(icon: "thunderstorm")
        case .tropicalStorm:
            return AnimatedIcon(icon: "thunderstorm")
        default:
            return AnimatedIcon(icon: "clear_day")
        }
    }
}

let iconFrames: [String: Double] = [
    "bell": 21,
    "clear_day": 30,
    "clear_night": 30,
    "cloudy": 30,
    "fog": 30,
    "partly_cloudy_day": 30,
    "partly_cloudy_night": 30,
    "rain": 30,
    "sleet": 30,
    "snow": 60,
    "thunderstorm": 46,
    "trending_down": 30,
    "trending_up": 30,
    "wind": 50
]
