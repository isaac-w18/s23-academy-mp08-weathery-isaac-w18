//
//  SettingsView.swift
//  Weathery
//
//  Created by Isaac Frank on 3/22/23.
//

import SwiftUI

struct SettingsView: View {
    @Binding var tempMeasure: String
    
    var body: some View {
        Picker("Temperature Units", selection: $tempMeasure) {
            Text("Kelvin").tag("K")
            Text("Celcius").tag("C")
            Text("Farenheit").tag("F")
        }
    }
}
