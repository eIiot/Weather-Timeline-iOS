//
//  Next7Days_Day.swift
//  Weather Timeline
//
//  Created by Eliot Hertenstein on 12/31/22.
//

import SwiftUI
import WeatherKit

struct DayCard: View {
    
    var day: DayWeather
    var hourly: [HourWeather]
    
    var body: some View {
        NavigationLink(destination: DayView(day: day, hourly: hourly)) {
            HStack(spacing: 20) {
                day.condition.animatedIcon
                VStack(alignment: .leading) {
                    HStack {
                        Text(day.date.formattedWeekday())
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.headline)
                        Spacer()
                        Text(day.highTemperature.formatted(.measurement(width: .narrow)))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.headline)
                        Text(day.lowTemperature.formatted(.measurement(width: .narrow)))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.headline)
                        
                    }
                    Text(day.condition.description + (day.precipitationChance > 0.3 ? ". \(Int(day.precipitationChance * 100))% chance of precipitation." : ""))
                        .foregroundColor(day.condition.colorScheme.captionColor)
                        .fontWeight(.semibold)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding(.horizontal, 22)
            .padding(.vertical, 20)
            .background(day.condition.colorScheme.primaryColor)
        }
    }
}

//struct Next7DaysList_DayCard_Previews: PreviewProvider {
//    static var previews: some View {
//        Next7DaysList_DayCard(day: "Today", conditions: "Moderate rain. 100% chance of precipiation.", highTemp: "47°", lowTemp: "56°", icon: "rain", frames: 29, background: "Rain")
//    }
//}
