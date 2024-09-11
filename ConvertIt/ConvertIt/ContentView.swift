//
//  ContentView.swift
//  ConvertIt
//
//  Created by Peter Berning on 9/10/24.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @State private var speedUnits: [String] = ["Km/h", "Mph"]
    @State private var volumeUnits: [String] = ["L", "Fl.oz"]
    @State private var areaUnits: [String] = ["Sq.m", "Sq.ft"]
    @State private var speedSelection: String = "Km/h"
    @State private var volumeSelection: String = "L"
    @State private var areaSelection: String = "Sq.m"
    @State private var speed: Double = 0
    @State private var volume: Double = 0
    @State private var area: Double = 0
    
    var convertedSpeed: Double {
        if speedSelection == "Km/h" {
            let milePerHour = speed * 1.609344
            return milePerHour
        } else if speedSelection == "Mph" {
            let kmPerHour = speed / 1.609344
            return kmPerHour
        }
        
        return 0
    }
    var speedLabelChange: String {
        if speedSelection == "Km/h" {
            return "Mph"
        } else if speedSelection == "Mph" {
            return "Km/h"
        }
        
        return ""
    }
    var convertedVolume: Double {
        if volumeSelection == "L" {
            let flOz = volume * 33.814
            return flOz
        } else if volumeSelection == "Fl.oz" {
            let liters = volume / 33.814
            return liters
        }
        
        return 0
    }
    var volumeLabelChange: String {
        if volumeSelection == "L" {
            return "Fl.oz"
        } else if volumeSelection == "Fl.oz" {
            return "L"
        }
        
        return ""
    }
    var convertedArea: Double {
        if areaSelection == "Sq.m" {
            let squareFeet = area * 10.764
            return squareFeet
        } else if areaSelection == "Sq.ft" {
            let squareMeter = area / 10.764
            return squareMeter
        }
        
        return 0
    }
    var areaLabelChange: String {
        if areaSelection == "Sq.m" {
            return "Sq.ft"
        } else if areaSelection == "Sq.ft" {
            return "Sq.m"
        }
        
        return ""
    }
    
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Speed") {
                    HStack {
                        TextField("Speed", value: $speed, format: .number)
                            .keyboardType(.decimalPad)
                        Spacer()
                        Picker("", selection: $speedSelection) {
                            ForEach(speedUnits, id: \.self) { unit in
                                Text(unit)
                            }
                        }
                    }
                }
                Section {
                    HStack {
                        Text("\(convertedSpeed)")
                        Spacer()
                        Text("\(speedLabelChange)")
                    }
                }
                Section("Volume") {
                    HStack {
                        TextField("Volume", value: $volume, format: .number)
                        Spacer()
                        Picker("", selection: $volumeSelection) {
                            ForEach(volumeUnits, id: \.self) { unit in
                                Text(unit)
                            }
                        }
                    }
                }
                Section {
                    HStack {
                        Text("\(convertedVolume)")
                        Spacer()
                        Text("\(volumeLabelChange)")
                    }
                }
                Section("Area") {
                    HStack {
                        TextField("Area", value: $area, format: .number)
                        Spacer()
                        Picker("", selection: $areaSelection) {
                            ForEach(areaUnits, id: \.self) { unit in
                                Text(unit)
                            }
                        }
                    }
                }
                Section {
                    HStack {
                        Text("\(convertedArea)")
                        Spacer()
                        Text("\(areaLabelChange)")
                    }
                }
            }
            .navigationBarTitle("Convert It")
        }
    }
}

#Preview {
    ContentView()
}
