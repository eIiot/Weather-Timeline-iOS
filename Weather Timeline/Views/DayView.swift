//
//  DayView.swift
//  Weather Timeline
//
//  Created by Eliot Hertenstein on 12/31/22.
//

import SwiftUI
import WeatherKit

struct DayView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var day: DayWeather
    var hourly: [HourWeather]
    var summary: Summary24Hour
    
    init(day: DayWeather, hourly: [HourWeather]) {
        self.day = day
        self.hourly = hourly
        self.summary = SummarizeHourly(data: hourly)
    }
    
    var body: some View {
        ScrollView{
            VStack(spacing: 16) {
                Connector(title: "1 Day from Now", content: "Sunday - 1/1/23")
                    .padding(.top, 16)
                #warning("TODO: Moon Info")
                #warning("TODO: Display Rain & Snow Differently")
                #warning("TODO: Swipe to navigate")
                
                HeaderCard(
                    icon: day.condition.animatedIcon,
                    colorScheme: day.condition.colorScheme,
                    title: day.date.formattedLongWeekday(),
                    condition: day.condition.description,
                    temperatures: [summary.highApparentTemperature, summary.lowApparentTemperature],
                    precipChance: day.precipitationChance,
                    precipAmmount: day.rainfallAmount,
                    windSpeed: day.wind.speed.converted(to: .milesPerHour),
                    windDirection: day.wind.compassDirection.description,
                    uvIndex: day.uvIndex.value,
                    uvStrength: day.uvIndex.category.description,
                    sunEvent: "Sunrise",
                    sunEventTime: "7:24",
                    sunEventHour: "AM",
                    moon: "First",
                    moonType: "Quarter",
                    humidity: summary.avgHumidity,
                    dewPoint: summary.avgDewPoint,
                    altTemperatures: [day.lowTemperature, day.highTemperature],
                    altTemperatureLabel: "Actual",
                    pressure: summary.avgPressure.converted(to: .mb),
                    visibility: summary.avgVisibility.converted(to: .miles)
                    )
                
                Connector(title: "24 Hour Forecast", content: "Clear sky")
                VStack(spacing: 0){
//                    HourCard(hour: "12", time: "AM", conditions: "Scattered Clouds", temp: "44°", description: "Actual 47°", icon: AnimatedIcon( icon: "partly_cloudy_night"), color: Color("Overcast Night"), subHeadColor: .white, precipChance: "0%", precipAmmount: "0 in.", wind: "13", windUnits: "MPH", windDirection: "North West", uv: "0", uvStrength: "Low", humidity: "93%", dew: "47°")
//                    HourCard(hour: "1", time: "AM", conditions: "Scattered Clouds", temp: "44°", description: "Actual 47°", icon: AnimatedIcon( icon: "partly_cloudy_night"), color: Color("Overcast Night"), subHeadColor: .white, precipChance: "0%", precipAmmount: "0 in.", wind: "13", windUnits: "MPH", windDirection: "North West", uv: "0", uvStrength: "Low", humidity: "93%", dew: "47°")
//                    HourCard(hour: "2", time: "AM", conditions: "Scattered Clouds", temp: "44°", description: "Actual 47°", icon: AnimatedIcon( icon: "partly_cloudy_night"), color: Color("Overcast Night"), subHeadColor: .white, precipChance: "0%", precipAmmount: "0 in.", wind: "13", windUnits: "MPH", windDirection: "North West", uv: "0", uvStrength: "Low", humidity: "93%", dew: "47°")
//                    HourCard(hour: "3", time: "AM", conditions: "Scattered Clouds", temp: "44°", description: "Actual 47°", icon: AnimatedIcon( icon: "partly_cloudy_night"), color: Color("Overcast Night"), subHeadColor: .white, precipChance: "0%", precipAmmount: "0 in.", wind: "13", windUnits: "MPH", windDirection: "North West", uv: "0", uvStrength: "Low", humidity: "93%", dew: "47°")
//                    HourCard(hour: "4", time: "AM", conditions: "Clear Sky", temp: "44°", description: "Actual 47°", icon: AnimatedIcon( icon: "clear_night"), color: Color("Clear Night"), subHeadColor: .white, precipChance: "0%", precipAmmount: "0 in.", wind: "13", windUnits: "MPH", windDirection: "North West", uv: "0", uvStrength: "Low", humidity: "93%", dew: "47°")
//                    HourCard(hour: "5", time: "AM", conditions: "Clear Sky", temp: "44°", description: "Actual 47°", icon: AnimatedIcon( icon: "clear_night"), color: Color("Clear Night"), subHeadColor: .white, precipChance: "0%", precipAmmount: "0 in.", wind: "13", windUnits: "MPH", windDirection: "North West", uv: "0", uvStrength: "Low", humidity: "93%", dew: "47°")
//                    HourCard(hour: "6", time: "AM", conditions: "Clear Sky", temp: "44°", description: "Actual 47°", icon: AnimatedIcon( icon: "clear_night"), color: Color("Clear Night"), subHeadColor: .white, precipChance: "0%", precipAmmount: "0 in.", wind: "13", windUnits: "MPH", windDirection: "North West", uv: "0", uvStrength: "Low", humidity: "93%", dew: "47°")
//                    HourCard(hour: "7", time: "AM", conditions: "Clear Sky", temp: "44°", description: "Actual 47°", icon: AnimatedIcon( icon: "clear_night"), color: Color("Clear Night"), subHeadColor: .white, precipChance: "0%", precipAmmount: "0 in.", wind: "13", windUnits: "MPH", windDirection: "North West", uv: "0", uvStrength: "Low", humidity: "93%", dew: "47°")
                }
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                .cornerRadius(5)
                Connector(title: "Sunrise", content: "7:24AM - in 16 hours and 37 mins")
                VStack(spacing: 0) {
//                    HourCard(hour: "8", time: "AM", conditions: "Clear sky", temp: "44°", description: "Actual 47°", icon: AnimatedIcon( icon: "clear_day"), color: Color("Clear Day"), subHeadColor: .white, precipChance: "0%", precipAmmount: "0 in.", wind: "13", windUnits: "MPH", windDirection: "North West", uv: "0", uvStrength: "Low", humidity: "93%", dew: "47°")
//                    HourCard(hour: "9", time: "AM", conditions: "Clear sky", temp: "44°", description: "Actual 47°", icon: AnimatedIcon( icon: "clear_day"), color: Color("Clear Day"), subHeadColor: .white, precipChance: "0%", precipAmmount: "0 in.", wind: "13", windUnits: "MPH", windDirection: "North West", uv: "0", uvStrength: "Low", humidity: "93%", dew: "47°")
//                    HourCard(hour: "10", time: "AM", conditions: "Clear sky", temp: "44°", description: "Actual 47°", icon: AnimatedIcon( icon: "clear_day"), color: Color("Clear Day"), subHeadColor: .white, precipChance: "0%", precipAmmount: "0 in.", wind: "13", windUnits: "MPH", windDirection: "North West", uv: "0", uvStrength: "Low", humidity: "93%", dew: "47°")
//                    HourCard(hour: "11", time: "AM", conditions: "Clear sky", temp: "44°", description: "Actual 47°", icon: AnimatedIcon( icon: "clear_day"), color: Color("Clear Day"), subHeadColor: .white, precipChance: "0%", precipAmmount: "0 in.", wind: "13", windUnits: "MPH", windDirection: "North West", uv: "0", uvStrength: "Low", humidity: "93%", dew: "47°")
//                    HourCard(hour: "12", time: "PM", conditions: "Clear sky", temp: "44°", description: "Actual 47°", icon: AnimatedIcon( icon: "clear_day"), color: Color("Clear Day"), subHeadColor: .white, precipChance: "0%", precipAmmount: "0 in.", wind: "13", windUnits: "MPH", windDirection: "North West", uv: "0", uvStrength: "Low", humidity: "93%", dew: "47°")
//                    HourCard(hour: "1", time: "PM", conditions: "Clear sky", temp: "44°", description: "Actual 47°", icon: AnimatedIcon( icon: "clear_day"), color: Color("Clear Day"), subHeadColor: .white, precipChance: "0%", precipAmmount: "0 in.", wind: "13", windUnits: "MPH", windDirection: "North West", uv: "0", uvStrength: "Low", humidity: "93%", dew: "47°")
//                    HourCard(hour: "2", time: "PM", conditions: "Clear sky", temp: "44°", description: "Actual 47°", icon: AnimatedIcon( icon: "clear_day"), color: Color("Clear Day"), subHeadColor: .white, precipChance: "0%", precipAmmount: "0 in.", wind: "13", windUnits: "MPH", windDirection: "North West", uv: "0", uvStrength: "Low", humidity: "93%", dew: "47°")
//                    HourCard(hour: "3", time: "PM", conditions: "Clear sky", temp: "44°", description: "Actual 47°", icon: AnimatedIcon( icon: "clear_day"), color: Color("Clear Day"), subHeadColor: .white, precipChance: "0%", precipAmmount: "0 in.", wind: "13", windUnits: "MPH", windDirection: "North West", uv: "0", uvStrength: "Low", humidity: "93%", dew: "47°")
//                    HourCard(hour: "4", time: "PM", conditions: "Clear sky", temp: "44°", description: "Actual 47°", icon: AnimatedIcon( icon: "clear_day"), color: Color("Clear Day"), subHeadColor: .white, precipChance: "0%", precipAmmount: "0 in.", wind: "13", windUnits: "MPH", windDirection: "North West", uv: "0", uvStrength: "Low", humidity: "93%", dew: "47°")
                }
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                .cornerRadius(5)
                Connector(title: "Sunset", content: "5PM - in 1 day")
                VStack(spacing: 0) {
//                    HourCard(hour: "5", time: "PM", conditions: "Clear sky", temp: "44°", description: "Actual 47°", icon: AnimatedIcon( icon: "clear_night"), color: Color("Clear Night"), subHeadColor: .white, precipChance: "0%", precipAmmount: "0 in.", wind: "13", windUnits: "MPH", windDirection: "North West", uv: "0", uvStrength: "Low", humidity: "93%", dew: "47°")
//                    HourCard(hour: "6", time: "PM", conditions: "Clear sky", temp: "44°", description: "Actual 47°", icon: AnimatedIcon( icon: "clear_night"), color: Color("Clear Night"), subHeadColor: .white, precipChance: "0%", precipAmmount: "0 in.", wind: "13", windUnits: "MPH", windDirection: "North West", uv: "0", uvStrength: "Low", humidity: "93%", dew: "47°")
//                    HourCard(hour: "7", time: "PM", conditions: "Clear sky", temp: "44°", description: "Actual 47°", icon: AnimatedIcon( icon: "clear_night"), color: Color("Clear Night"), subHeadColor: .white, precipChance: "0%", precipAmmount: "0 in.", wind: "13", windUnits: "MPH", windDirection: "North West", uv: "0", uvStrength: "Low", humidity: "93%", dew: "47°")
//                    HourCard(hour: "8", time: "PM", conditions: "Scattered clouds", temp: "44°", description: "Actual 47°", icon: AnimatedIcon( icon: "clear_night"), color: Color("Overcast Night"), subHeadColor: .white, precipChance: "0%", precipAmmount: "0 in.", wind: "13", windUnits: "MPH", windDirection: "North West", uv: "0", uvStrength: "Low", humidity: "93%", dew: "47°")
//                    HourCard(hour: "9", time: "PM", conditions: "Scattered clouds", temp: "44°", description: "Actual 47°", icon: AnimatedIcon( icon: "clear_night"), color: Color("Overcast Night"), subHeadColor: .white, precipChance: "0%", precipAmmount: "0 in.", wind: "13", windUnits: "MPH", windDirection: "North West", uv: "0", uvStrength: "Low", humidity: "93%", dew: "47°")
//                    HourCard(hour: "10", time: "PM", conditions: "Scattered clouds", temp: "44°", description: "Actual 47°", icon: AnimatedIcon( icon: "clear_night"), color: Color("Overcast Night"), subHeadColor: .white, precipChance: "0%", precipAmmount: "0 in.", wind: "13", windUnits: "MPH", windDirection: "North West", uv: "0", uvStrength: "Low", humidity: "93%", dew: "47°")
//                    HourCard(hour: "11", time: "PM", conditions: "Scattered clouds", temp: "44°", description: "Actual 47°", icon: AnimatedIcon( icon: "clear_night"), color: Color("Overcast Night"), subHeadColor: .white, precipChance: "0%", precipAmmount: "0 in.", wind: "13", windUnits: "MPH", windDirection: "North West", uv: "0", uvStrength: "Low", humidity: "93%", dew: "47°")
                }
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                .cornerRadius(5)
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
                        
                        Text("Berkeley")
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

//struct DayView_Previews: PreviewProvider {
//    static var previews: some View {
//        DayView()
//    }
//}
