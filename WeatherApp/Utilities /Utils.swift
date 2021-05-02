//
//  Utils.swift
//  WeatherApp
//
//  Created by Ramnath Sridhar on 30/04/21.
//

import UIKit

class Utils {
    
    static let sharedInstance = Utils()
    
    private init(){}
    
    func getImageIconNameForWeatherCode(weatherCode:Int) -> String {
        switch (weatherCode) {
            case 0...200 :
                return ImageConstants.thunderStormOne.rawValue
            case 300..<500 :
                return ImageConstants.lightRain.rawValue
            case 500..<600 :
                return ImageConstants.shower.rawValue
            case 600..<700 :
                return ImageConstants.snowFour.rawValue
            case 701...771 :
                return ImageConstants.fog.rawValue
            case 800 :
                return ImageConstants.sunny.rawValue
            case 801...804 :
                return ImageConstants.cloudyTwo.rawValue
            default :
                return ImageConstants.unavailable.rawValue
            }
        }
}
