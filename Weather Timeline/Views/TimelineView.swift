//
//  TimelineView.swift
//  Weather Timeline
//
//  Created by Eliot Hertenstein on 12/30/22.
//

import SwiftUI
import CoreLocation
import WeatherKit

struct TimelineView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let weather: Weather
    let locationName: String
    
    var body: some View {
        ScrollView{
            VStack(spacing: 16) {
                AlertCard()
                
                #warning("TODO: differentiate between rainfallAmount and snowfallAmount")
                HeaderCard(
                    icon: weather.currentWeather.animatedIcon,
                    colorScheme: weather.currentWeather.colorScheme,
                    title: "Right Now",
                    condition: weather.currentWeather.condition.description,
                    temperatures: [weather.currentWeather.apparentTemperature],
                    precipChance: weather.dailyForecast.forecast[weather.dailyForecast.startIndex].precipitationChance,
                    precipAmmount: weather.dailyForecast.forecast[weather.dailyForecast.startIndex].rainfallAmount,
                    windSpeed: weather.currentWeather.wind.speed.converted(to: .milesPerHour),
                    windDirection: weather.currentWeather.wind.compassDirection.description,
                    uvIndex: weather.currentWeather.uvIndex.value,
                    uvStrength: weather.currentWeather.uvIndex.category.description,
                    sunEvent: "Sunrise",
                    sunEventTime: "7:24",
                    sunEventHour: "AM",
                    moon: "First",
                    moonType: "Quarter",
                    humidity: weather.currentWeather.humidity,
                    dewPoint: weather.currentWeather.dewPoint,
                    altTemperatures: [weather.currentWeather.temperature],
                    altTemperatureLabel: "Actual",
                    pressure: weather.currentWeather.pressure.converted(to: .mb),
                    visibility: weather.currentWeather.visibility.converted(to: .miles)
                )
                Connector(title: "Next Hour", content: weather.hourlyForecast.forecast[weather.hourlyForecast.startIndex].condition.description)
                Next24HoursCard(data: weather.hourlyForecast.forecast)
                Connector(title: "Next 7 Days", content: "Expect rain for the upcoming week. Clear predicted Sunday. The high temperature will be 50°F today, and the low will be 44°F on Sunday.")
                VStack(spacing: 0) {
                    ForEach(Array(weather.dailyForecast.enumerated()), id: \.offset) { i, day in
                        #warning("TODO: 'Today' and 'Tomorrow' labels for first two days")
                        DayCard(day: day, hourly: weather.dailyHourlyForecast[i])
                    }
                }
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .cornerRadius(5)
                Text("Last updated 4 minutes ago")
                    .font(.footnote)
                    .foregroundColor(Color(uiColor: .systemGray2))
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .top
            )
            .padding()
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack(spacing: 6) {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "arrow.left")
                                .fontWeight(.bold)
                                .font(.system(size: 22))
                                .foregroundColor(.white)
                        }
                        
                        Text(locationName)
                            .fontWeight(.semibold)
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                    }.padding(.bottom, 8)
                }
            }
            .toolbarBackground(Color("Background"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }.background(
            Color("Background")
        )
    }
}

//struct TimelineView_Previews: PreviewProvider {
//    static let weatherService = WeatherService()
//
//    static let weather = try await weatherService.weather(for: location)
//
//    static var previews: some View {
//        TimelineView(weather: weather!)
//    }
//}
