//
//  ContentView.swift
//  Weathery
//
//  Created by AlecNipp on 11/8/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherDataViewModel()
    @State var city = ""
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [Color.lightBlue, Color.blue], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.weatherData) { weather in
                            CityWeatherView(viewModel: CityWeatherVM(model: weather, tempMeasure: viewModel.tempMeasure))
                        }
                    }
                    // MARK: This onAppear modifier is just fetching the data for Charlotte when this view appears. You can get rid of it.
//                    .onAppear {
//                        viewModel.getWeather(cityString: "Charlotte")
//                    }
                }
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Weathery").bold()
                            .font(.largeTitle)
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "sun.max.fill")
                            .foregroundColor(.yellow)
                            .font(.title2)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            viewModel.toggleSheet()
                        } label: {
                            Image(systemName: "plus")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                        .sheet(isPresented: $viewModel.sheetIsPresented) {
                            NewCityView(city: $city, viewModel: viewModel)
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                            SettingsView(tempMeasure: $viewModel.tempMeasure)
                        } label: {
                            Image(systemName: "gear")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                    }
                }
    //            .navigationBarItems(leading:
    //                                    HStack {
    //                Text("Weathery")
    //                Image(systemName: "sun.max")
    //            },
    //                                trailing: Text("hi"))
            }
            }
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
