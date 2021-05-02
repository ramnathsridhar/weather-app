//
//  WeatherInformationViewModel.swift
//  WeatherApp
//
//  Created by Ramnath Sridhar on 01/05/21.
//

import Foundation

protocol CityWeatherDelegate:AnyObject{
    func getWeatherForCitySuccessful(weatherDetails:WeatherModel)
    func getWeatherForCityFailed(errorMessage:String)
}

class WeatherInformationViewModel{
    var cityName:String
    var cityWeatherDetails:WeatherModel?
    var weatherDelegate:CityWeatherDelegate
    
    
    init(weatherDetails:WeatherModel? = nil ,cityName:String,cityWeatherdelegate:CityWeatherDelegate) {
        self.cityWeatherDetails = weatherDetails
        self.cityName = cityName
        self.weatherDelegate = cityWeatherdelegate
    }
    
    func getWeatherForCity(){
        //The city name is validated before making the API call
        NetworkManager.sharedInstance.getWeatherForCity(cityName: self.cityName) { (result) in
            switch result{
            case .failure(let errorMessage):
                print(errorMessage)
                self.weatherDelegate.getWeatherForCityFailed(errorMessage: errorMessage.rawValue)
            case .success(let weatherDetailsForCity):
                self.cityWeatherDetails = weatherDetailsForCity
                self.weatherDelegate.getWeatherForCitySuccessful(weatherDetails: weatherDetailsForCity)
            }
        }
    }
}