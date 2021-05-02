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
            case 0...300 :
                return ImageConstants.thunderStormOne.rawValue
            case 301...500 :
                return ImageConstants.lightRain.rawValue
            case 501...600 :
                return ImageConstants.shower.rawValue
            case 601...700 :
                return ImageConstants.snowFour.rawValue
            case 701...771 :
                return ImageConstants.fog.rawValue
            case 772...799 :
                return ImageConstants.thunderStormThree.rawValue
            case 800 :
                return ImageConstants.sunny.rawValue
            case 801...804 :
                return ImageConstants.cloudyTwo.rawValue
            case 900...903, 905...1000 :
                return ImageConstants.thunderStormThree.rawValue
            case 903 :
                return ImageConstants.snowFive.rawValue
            case 904 :
                return ImageConstants.sunny.rawValue
            default :
                return ImageConstants.unavailable.rawValue
            }
        }
}
