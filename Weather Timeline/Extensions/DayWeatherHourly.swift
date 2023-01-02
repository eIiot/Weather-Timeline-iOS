//
//  DayWeatherHourly.swift
//  Weather Timeline
//
//  Created by Eliot Hertenstein on 1/2/23.
//

import Foundation
import WeatherKit

extension Weather {
    var dailyHourlyForecast: [[HourWeather]] {
        var hours: [[HourWeather]] = []
        
        self.dailyForecast.forEach { day in
            // get the start and end of the day
            
            let oneDayLater = Calendar.current.date(byAdding: .day, value: 1, to: day.date)!
            
            let dayHours = self.hourlyForecast.forecast.filter {
                $0.date > Date() && $0.date >= day.date && $0.date < oneDayLater
            }
            
            hours.append(dayHours)
        }
        
        return hours
    }
}
