//
//  LocationButton.swift
//  Weather Timeline
//
//  Created by Eliot Hertenstein on 12/30/22.
//

import SwiftUI

struct Timeline_Header: View {
    
    @State private var isOpen = false
    
    var body: some View {
        VStack(spacing: 0) {
                HStack(alignment: .top, spacing: 20) {
                    AnimatedIcon(frames: 30, icon:"rain", width: 38, height: 38)
                    VStack(alignment: .leading) {                Text("Right Now")
                            .font(.title3)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        Text("Light Rain")
                            .font(.subheadline)
                            .foregroundColor(Color(uiColor: .systemGray4))
                            .fontWeight(.semibold)
                    }
                    Spacer()
                    Text("57°")
                        .fontWeight(.bold)
                        .font(.system(size: 32))
                        .foregroundColor(.white)
                }
                .padding(.bottom)
                HStack(alignment: .bottom) {
                    VStack(spacing: 3.0) {
                        Image(systemName: "umbrella.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 22))
                        Text("96%")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        Text("0 in.")
                            .font(.footnote)
                            .foregroundColor(Color(uiColor: .systemGray4))
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .truncationMode(.tail)
                    }
                    Spacer()
                    VStack(spacing: 3.0) {
                        Image(systemName: "arrow.up.right")
                            .foregroundColor(.white)
                            .font(.system(size: 22))
                        TextWithUnit(text: "16", unit: "MPH", font: .subheadline, unitFont: .footnote, color: .white, fontWeight: .bold)
                        Text("South West")
                            .font(.footnote)
                            .foregroundColor(Color(uiColor: .systemGray4))
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .truncationMode(.tail)
                    }
                    Spacer()
                    VStack(spacing: 3.0) {
                        Image(systemName: "sun.min.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 22))
                        Text("UV 0")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        Text("Low")
                            .font(.footnote)
                            .foregroundColor(Color(uiColor: .systemGray4))
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .truncationMode(.tail)
                    }
                    Spacer()
                    VStack(spacing: 3.0) {
                        Image(systemName: "sun.and.horizon.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 22))
                        HStack(alignment: .bottom, spacing: 0) {
                            Text("7:24")
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                            Text("AM")
                                .font(.footnote)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }.lineLimit(1)
                        Text("Sunrise")
                            .font(.footnote)
                            .foregroundColor(Color(uiColor: .systemGray4))
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .truncationMode(.tail)
                    }
                    Spacer()
                    VStack(spacing: 3.0) {
                        Image(systemName: "moonphase.first.quarter.inverse")
                            .foregroundColor(.white)
                            .font(.system(size: 22))
                        Text("First")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        Text("Quarter")
                            .font(.footnote)
                            .foregroundColor(Color(uiColor: .systemGray4))
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .truncationMode(.tail)
                    }
                }
            VStack(spacing: 0) {
                    Divider()
                        .frame(height: 3)
                        .foregroundColor(Color("background"))
                        .padding(.vertical)
                        .padding(10)
                    HStack(alignment: .bottom) {
                        VStack(spacing: 3.0) {
                            Image(systemName: "humidity.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 22))
                            Text("94%")
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                            Text("Humidity")
                                .font(.footnote)
                                .foregroundColor(Color(uiColor: .systemGray4))
                                .fontWeight(.semibold)
                                .lineLimit(1)
                                .truncationMode(.tail)
                        }
                        Spacer()
                        VStack(spacing: 3.0) {
                            Image(systemName: "drop.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 22))
                            Text("54°")
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                            Text("Dew Point")
                                .font(.footnote)
                                .foregroundColor(Color(uiColor: .systemGray4))
                                .fontWeight(.semibold)
                                .lineLimit(1)
                                .truncationMode(.tail)
                        }
                        Spacer()
                        VStack(spacing: 3.0) {
                            Image(systemName: "thermometer.medium")
                                .foregroundColor(.white)
                                .font(.system(size: 22))
                            Text("56°")
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                            Text("Feels Like")
                                .font(.footnote)
                                .foregroundColor(Color(uiColor: .systemGray4))
                                .fontWeight(.semibold)
                                .lineLimit(1)
                                .truncationMode(.tail)
                        }
                        Spacer()
                        VStack(spacing: 3.0) {
                            Image(systemName: "gauge.high")
                                .foregroundColor(.white)
                                .font(.system(size: 22))
                            HStack(alignment: .bottom, spacing: 0) {
                                Text("1012 ")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                Text("MB")
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            }.lineLimit(1)
                            Text("Pressure")
                                .font(.footnote)
                                .foregroundColor(Color(uiColor: .systemGray4))
                                .fontWeight(.semibold)
                                .lineLimit(1)
                                .truncationMode(.tail)
                        }
                        Spacer()
                        VStack(spacing: 3.0) {
                            Image(systemName: "eye.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 22))
                            HStack(alignment: .bottom, spacing: 0) {
                                Text("10 ")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                Text("MILE")
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            }.lineLimit(1)
                            Text("Visibility")
                                .font(.footnote)
                                .foregroundColor(Color(uiColor: .systemGray4))
                                .fontWeight(.semibold)
                                .lineLimit(1)
                                .truncationMode(.tail)
                        }
                    }
                }
                .frame(height: isOpen ? nil : 0, alignment: .top)
                .clipped()
                
            }
            .padding(.top, 20)
            .padding(.horizontal, 22)
            .padding(.bottom, 24)
            .background(Color("Rain")    .cornerRadius(5)
            )
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
            .onTapGesture {
                withAnimation {
                    isOpen.toggle()
                }
            }
    }
}

struct TimelineHeader_Previews: PreviewProvider {
    static var previews: some View {
        Timeline_Header()
    }
}
