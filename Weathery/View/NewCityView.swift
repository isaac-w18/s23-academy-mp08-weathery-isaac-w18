//
//  NewCityView.swift
//  Weathery
//
//  Created by Isaac Frank on 3/22/23.
//

import SwiftUI

struct NewCityView: View {
    @Binding var city: String
    @ObservedObject var viewModel: WeatherDataViewModel
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section {
                TextField("City Name", text: $city)
            }
            .onSubmit {
                viewModel.getWeather(cityString: city)
                city = ""
                dismiss()
            }
            
            Section {
                Button {
                    viewModel.getWeather(cityString: city)
                    city = ""
                    dismiss()
                } label: {
                    Text("Enter")
                }
            }
        }
        
    }
}

//struct NewCityView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewCityView(city: "Chapel Hill")
//    }
//}
