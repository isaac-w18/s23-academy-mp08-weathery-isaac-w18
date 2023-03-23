//
//  CityWeatherView.swift
//  Weathery
//
//  Created by AlecNipp on 11/8/22.
//

import SwiftUI

struct CityWeatherView: View {
    /// The View Model doing all the work for our view.
    let viewModel: CityWeatherVM
    
    var body: some View {
        VStack {
            Spacer()
            Text(viewModel.cityName).padding()
                .font(.title)
            Group {
                Text(viewModel.formattedCurrentTemp)
                    .font(.largeTitle)
                Text("high: \(viewModel.high)  low: \(viewModel.low)")
            }
            .padding()
            
            Image(systemName: viewModel.icon)
                .font(.largeTitle)
            Text(viewModel.description)
            
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.2), in: RoundedRectangle(cornerRadius: 10))
    }
}

struct CityWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CityWeatherView(viewModel: CityWeatherVM(model: Weather.example, tempMeasure: "K"))
    }
}
