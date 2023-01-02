//
//  WeatherSummaryFunction.swift
//  Weather Timeline
//
//  Created by Eliot Hertenstein on 1/1/23.
//

import Foundation
import WeatherKit

struct Summary24Hour {
    let icon: AnimatedIcon
    let description: String
    let highApparentTemperature: Measurement<UnitTemperature>
    let lowApparentTemperature: Measurement<UnitTemperature>
    let avgHumidity: Double
    let avgDewPoint: Measurement<UnitTemperature>
    let avgPressure: Measurement<UnitPressure>
    let avgVisibility: Measurement<UnitLength>
}

enum DescriptionProperties {
    case highLow, precip
}

func SummarizeHourly(data: [HourWeather], descriptionIncludes: [DescriptionProperties] = [.highLow]) -> Summary24Hour {
    var isPrecip = 0;
    
    var conditionCounts: [WeatherCondition: Int] = [:]
    
    var highTemp: Measurement<UnitTemperature>? = nil
    
    var lowTemp: Measurement<UnitTemperature>? = nil
    
    var highApparentTemp: Measurement<UnitTemperature>? = nil
    
    var lowApparentTemp: Measurement<UnitTemperature>? = nil
    
    var highPrecipChance: Double = 0;
    
    var humidities: [Double] = []
    
    var dewPoints: [Measurement<UnitTemperature>] = []
    
    var pressures: [Measurement<UnitPressure>] = []
    
    var visibilities: [Measurement<UnitLength>] = []
        
    for hour in data {
        if hour.condition.isPrecipitation {
            isPrecip += 1
        } else {
            isPrecip -= 1
        }
        
        if let currentCount = conditionCounts[hour.condition] {
            conditionCounts[hour.condition] = currentCount + 1
        } else {
            conditionCounts[hour.condition] = 1
        }
        
        if let ht = highTemp {
            if hour.temperature.value > ht.value {
                highTemp = hour.temperature
            }
        } else {
            highTemp = hour.temperature
        }
        
        if let lt = lowTemp {
            if hour.temperature.value < lt.value {
                lowTemp = hour.temperature
            }
        } else {
            lowTemp = hour.temperature
        }
        
        if let hat = highApparentTemp {
            if hour.apparentTemperature.value > hat.value {
                highApparentTemp = hour.apparentTemperature
            }
        } else {
            highApparentTemp = hour.temperature
        }
        
        if let lat = lowApparentTemp {
            if hour.apparentTemperature.value < lat.value {
                lowApparentTemp = hour.apparentTemperature
            }
        } else {
            lowApparentTemp = hour.apparentTemperature
        }
        
        if highPrecipChance < hour.precipitationChance {
            highPrecipChance = hour.precipitationChance
        }
        
        humidities.append(hour.humidity)
        dewPoints.append(hour.dewPoint)
        pressures.append(hour.pressure)
        visibilities.append(hour.visibility)
    }
    
    let isClear = isPrecip < 0
    
    let mostCommonCondition = conditionCounts.filter { $0.key.isPrecipitation == !isClear } .max { a, b in a.value < b.value }?.key ?? .clear
    
    let description = "\(mostCommonCondition.description)." +
    (descriptionIncludes.contains(.highLow) ? " High of \(highTemp?.formatted() ?? "unknown"), with a low of \(lowTemp?.formatted() ?? "unknown")." : "") +
    (descriptionIncludes.contains(.precip) ? " \(Int(highPrecipChance * 100))% chance of precipitation." : "")
    
    
    let avgHumidity = humidities.reduce(0, +) / Double(humidities.count)
   
    func averageMeasurements<UnitType: Dimension>(measurements: [Measurement<UnitType>]) -> Measurement<UnitType> {
        let sum = measurements.reduce(0, { $0 + $1.value })
        let average = sum / Double(measurements.count)
        return Measurement(value: average, unit: measurements[0].unit)
    }
        
    let avgDewPoint = averageMeasurements(measurements: dewPoints)
        
    let avgPressure = averageMeasurements(measurements: pressures)
        
    let avgVisibility = averageMeasurements(measurements: visibilities)

    return Summary24Hour (icon: mostCommonCondition.animatedIcon, description: description, highApparentTemperature: highApparentTemp!, lowApparentTemperature: lowApparentTemp!, avgHumidity: avgHumidity, avgDewPoint: avgDewPoint, avgPressure: avgPressure, avgVisibility: avgVisibility)
}
