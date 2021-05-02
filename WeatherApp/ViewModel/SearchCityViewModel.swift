//
//  SearchCityViewModel.swift
//  WeatherApp
//
//  Created by Ramnath Sridhar on 30/04/21.
//

import Foundation

protocol SearchCityNameDelegate:AnyObject{
    func searchForCitySuccessful()
    func searchForCityFailed(errorMessage:String)
}

class SearchCityViewModel{
    var cityName:String
    var cityInputDelegate:SearchCityNameDelegate
    
    init(delegate:SearchCityNameDelegate) {
        self.cityInputDelegate = delegate
        self.cityName = String.empty
    }
    
    func getWeatherForCity(){
        //The city name is validated before making the API call
        if validateCityName() {
            self.cityInputDelegate.searchForCitySuccessful()
        }else{
            self.cityInputDelegate.searchForCityFailed(errorMessage: ErrorMessages.enterValidCityName.rawValue)
        }
    }
    
    //Function to validate the city name entered
    //This function will return true if the city name is not empty
    func validateCityName() -> Bool {
        if self.cityName.isEmpty{
            return false
        }
        return true
    }
}
