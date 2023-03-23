//
//  WeatherViewModel.swift
//  Weathery
//
//  Created by AlecNipp on 11/8/22.
//

import Foundation


/// A wrapper struct that will contain all the logic for presenting our Weather data.
/// It accepts a `Weather` struct, and contains methods for representing the data contained in that struct
struct CityWeatherVM {
    
    /// The weather data being processed by this view model
    let model: Weather
    var tempMeasure: String
    
    
    // MARK: Here's where you should add logic for different representations of the temperature in Fahrenheit, Celsius, etc. You'll also want to make the methods for representing the other data (e.g., the weather icon)
    var description: String {
        guard let weatherDescription = model.clouds?.all else {
            guard let weatherDescription = model.rain?.singleHour else {
                guard let weatherDescription = model.wind?.speed else {
                    return "no data"
                }
                return "\(weatherDescription) m/s"
            }
            return "\(weatherDescription) hours"
        }
        return "\(weatherDescription) clouds"
    }
    
    var icon: String {
        guard let iconName = model.weather?[0].icon else {
            return "no data"
        }
        return iconName
    }
    
    var low: String {
        if var temp = model.main?.tempMin {
            if(tempMeasure == "C") {
                temp -= 273.15
            } else if(tempMeasure == "F") {
                temp -= 273.15
                temp *= 1.8
                temp += 32
            }
            temp = round(100 * temp) / 100
            return "\(temp)" + tempMeasure
        }
        return "no data"
    }
    
    var high: String {
        if var temp = model.main?.tempMax {
            if(tempMeasure == "C") {
                temp -= 273.15
            } else if(tempMeasure == "F") {
                temp -= 273.15
                temp *= 1.8
                temp += 32
            }
            temp = round(100 * temp) / 100
            return "\(temp)" + tempMeasure
        }
        return "no data"
//        let result = temp.map { String($0) } ?? "no data"
    }
    
    /// A getter that returns the formatted temperature, or "No temp" if no data is available. It's currently in Kelvin.
    var formattedCurrentTemp: String {
        guard var temp = model.main?.temp else { return "No temp" }
        
        if(tempMeasure == "C") {
            temp -= 273.15
        } else if(tempMeasure == "F") {
            temp -= 273.15
            temp *= 1.8
            temp += 32
        }
        temp = round(100 * temp) / 100
        return "\(temp)" + tempMeasure
    }
    
    var cityName: String {
        return model.name ?? "No name"
    }
    
}
