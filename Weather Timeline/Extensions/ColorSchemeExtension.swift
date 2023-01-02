//
//  ColorScheme.swift
//  Weather Timeline
//
//  Created by Eliot Hertenstein on 12/31/22.
//

import SwiftUI
import WeatherKit
import Foundation

struct ColorScheme {
    let primaryColor: Color
    let textColor: Color
    let captionColor: Color
}

extension CurrentWeather {
    var colorScheme: ColorScheme {
        switch self.condition {
        case .rain, .sunShowers, .isolatedThunderstorms, .scatteredThunderstorms, .strongStorms, .thunderstorms:
            return ColorScheme(primaryColor: Color("Rain"), textColor: .white, captionColor: Color(uiColor: .systemGray4))
        case .sleet, .wintryMix, .freezingDrizzle, .freezingRain:
            return ColorScheme(primaryColor: Color("Sleet"), textColor: Color("Black"), captionColor: Color(uiColor: .systemGray))
        case .snow, .flurries, .sunFlurries, .heavySnow, .blowingSnow:
            return ColorScheme(primaryColor: Color("Snow"), textColor: .white, captionColor: Color(uiColor: .systemGray4))
        case .cloudy, .mostlyCloudy, .partlyCloudy:
            if self.isDaylight {
                return ColorScheme(primaryColor: Color("Cloudy Day"), textColor: .white, captionColor: Color(uiColor: .systemGray4))
            } else {
                return ColorScheme(primaryColor: Color("Cloudy Night"), textColor: .white, captionColor: Color(uiColor: .systemGray4))
            }
        case .clear, .mostlyClear:
            if self.isDaylight {
                return ColorScheme(primaryColor: Color("Clear Day"), textColor: .white, captionColor: .white)
            } else {
                return ColorScheme(primaryColor: Color("Clear Night"), textColor: .white, captionColor: .white)
            }
        case .blowingDust, .foggy, .haze, .smoky:
            return ColorScheme(primaryColor: Color("Cloudy Day"), textColor: .white, captionColor: Color(uiColor: .systemGray4))
        case .breezy, .windy:
            return ColorScheme(primaryColor: Color("Clear Day"), textColor: .white, captionColor: Color(uiColor: .systemGray4))
        case .drizzle, .heavyRain:
            return ColorScheme(primaryColor: Color("Rain"), textColor: .white, captionColor: Color(uiColor: .systemGray4))
        case .frigid, .hail, .hot:
            return ColorScheme(primaryColor: Color("Clear Day"), textColor: .white, captionColor: .white)
        case .blizzard, .hurricane, .tropicalStorm:
            return ColorScheme(primaryColor: Color("Snow"), textColor: .white, captionColor: Color(uiColor: .systemGray4))
        default:
            if self.isDaylight {
                return ColorScheme(primaryColor: Color("Clear Day"), textColor: .white, captionColor: .white)
            } else {
                return ColorScheme(primaryColor: Color("Clear Night"), textColor: .white, captionColor: .white)
            }
        }
    }
}

extension HourWeather {
    var colorScheme: ColorScheme {
        switch self.condition {
        case .rain, .sunShowers, .isolatedThunderstorms, .scatteredThunderstorms, .strongStorms, .thunderstorms:
            return ColorScheme(primaryColor: Color("Rain"), textColor: .white, captionColor: Color(uiColor: .systemGray4))
        case .sleet, .wintryMix, .freezingDrizzle, .freezingRain:
            return ColorScheme(primaryColor: Color("Sleet"), textColor: Color("Black"), captionColor: Color(uiColor: .systemGray))
        case .snow, .flurries, .sunFlurries, .heavySnow, .blowingSnow:
            return ColorScheme(primaryColor: Color("Snow"), textColor: .white, captionColor: Color(uiColor: .systemGray4))
        case .cloudy, .mostlyCloudy, .partlyCloudy:
            if self.isDaylight {
                return ColorScheme(primaryColor: Color("Cloudy Day"), textColor: .white, captionColor: Color(uiColor: .systemGray4))
            } else {
                return ColorScheme(primaryColor: Color("Cloudy Night"), textColor: .white, captionColor: Color(uiColor: .systemGray4))
            }
        case .clear, .mostlyClear:
            if self.isDaylight {
                return ColorScheme(primaryColor: Color("Clear Day"), textColor: .white, captionColor: .white)
            } else {
                return ColorScheme(primaryColor: Color("Clear Night"), textColor: .white, captionColor: .white)
            }
        case .blowingDust, .foggy, .haze, .smoky:
            return ColorScheme(primaryColor: Color("Cloudy Day"), textColor: .white, captionColor: Color(uiColor: .systemGray4))
        case .breezy, .windy:
            return ColorScheme(primaryColor: Color("Clear Day"), textColor: .white, captionColor: Color(uiColor: .systemGray4))
        case .drizzle, .heavyRain:
            return ColorScheme(primaryColor: Color("Rain"), textColor: .white, captionColor: Color(uiColor: .systemGray4))
        case .frigid, .hail, .hot:
            return ColorScheme(primaryColor: Color("Clear Day"), textColor: .white, captionColor: .white)
        case .blizzard, .hurricane, .tropicalStorm:
            return ColorScheme(primaryColor: Color("Snow"), textColor: .white, captionColor: Color(uiColor: .systemGray4))
        default:
            if self.isDaylight {
                return ColorScheme(primaryColor: Color("Clear Day"), textColor: .white, captionColor: .white)
            } else {
                return ColorScheme(primaryColor: Color("Clear Night"), textColor: .white, captionColor: .white)
            }
        }
    }
}

extension WeatherCondition {
    
    /// Returns the Color Scheme for the current condition, without daylight data.
    /// Useful when `parent.colorScheme` isn't available (like for `DayWeather`)
    var colorScheme: ColorScheme {
        switch self {
        case .rain, .sunShowers, .isolatedThunderstorms, .scatteredThunderstorms, .strongStorms, .thunderstorms:
            return ColorScheme(primaryColor: Color("Rain"), textColor: .white, captionColor: Color(uiColor: .systemGray4))
        case .sleet, .wintryMix, .freezingDrizzle, .freezingRain:
            return ColorScheme(primaryColor: Color("Sleet"), textColor: Color("Black"), captionColor: Color(uiColor: .systemGray))
        case .snow, .flurries, .sunFlurries, .heavySnow, .blowingSnow:
            return ColorScheme(primaryColor: Color("Snow"), textColor: .white, captionColor: Color(uiColor: .systemGray4))
        case .cloudy, .mostlyCloudy, .partlyCloudy:
            return ColorScheme(primaryColor: Color("Cloudy Day"), textColor: .white, captionColor: Color(uiColor: .systemGray4))
        case .clear, .mostlyClear:
            return ColorScheme(primaryColor: Color("Clear Day"), textColor: .white, captionColor: .white)
        case .blowingDust, .foggy, .haze, .smoky:
            return ColorScheme(primaryColor: Color("Cloudy Day"), textColor: .white, captionColor: Color(uiColor: .systemGray4))
        case .breezy, .windy:
            return ColorScheme(primaryColor: Color("Clear Day"), textColor: .white, captionColor: Color(uiColor: .systemGray4))
        case .drizzle, .heavyRain:
            return ColorScheme(primaryColor: Color("Rain"), textColor: .white, captionColor: Color(uiColor: .systemGray4))
        case .frigid, .hail, .hot:
            return ColorScheme(primaryColor: Color("Clear Day"), textColor: .white, captionColor: .white)
        case .blizzard, .hurricane, .tropicalStorm:
            return ColorScheme(primaryColor: Color("Snow"), textColor: .white, captionColor: Color(uiColor: .systemGray4))
        default:
            return ColorScheme(primaryColor: Color("Clear Day"), textColor: .white, captionColor: .white)
        }
    }
}
