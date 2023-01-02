//
//  Next24HoursView.swift
//  Weather Timeline
//
//  Created by Eliot Hertenstein on 12/30/22.
//

import SwiftUI
import WeatherKit

struct Next24HoursView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let data: [HourWeather]
    let summary: Summary24Hour
    
    init(data: [HourWeather]) {
        self.data = data
        self.summary = SummarizeHourly(data: data, descriptionIncludes: [.precip])
    }
    
    var body: some View {
        ScrollView{
            LazyVStack (spacing: 16) {
                Connector(title: "Next 24 Hours", content: summary.description)
                    .padding(.top, 16)
                VStack(spacing: 0){
                    ForEach(data, id: \.self.date) { hour in
                        HourCard_Wrapper(hour: hour)
                    }
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

//struct Next24HoursView_Previews: PreviewProvider {
//    static var previews: some View {
//        Next24HoursView()
//    }
//}
