//
//  LocationButton.swift
//  Weather Timeline
//
//  Created by Eliot Hertenstein on 12/30/22.
//

import WeatherKit
import SwiftUI

struct Next24HoursCard: View {
    let data: [HourWeather]
    let summary: Summary24Hour
    
    init(data: [HourWeather]) {
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month, .day, .hour], from: Date())
        let now = calendar.date(from: dateComponents)!
        let oneDayFromNow = calendar.date(byAdding: .day, value: 1, to: now)!
        
        self.data = data.filter {
            $0.date >= now && $0.date <= oneDayFromNow
        }
        self.summary = SummarizeHourly(data: data)
    }
    
    var body: some View {
        NavigationLink(destination: Next24HoursView(data: data)) {
            HStack(spacing: 24) {
                summary.icon
                VStack(alignment: .leading) {
                    Text("Next 24 Hours")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.headline)
                    Text(summary.description)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                }
                Spacer()
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 24)
            .background(Color("Clear Day"))
            .cornerRadius(5)
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
        }
    }
}

//struct Timeline_Next24HoursCard_Previews: PreviewProvider {
//    static var previews: some View {
//        Timeline_Next24HoursCard(summary: Summary24Hour(icon: AnimatedIcon(icon:"clear_day"), description: "Light rain. High temperature 65°F. Chance of precipitation 1%")).preferredColorScheme(.dark)
//    }
//}
