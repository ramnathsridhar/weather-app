//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Ramnath Sridhar on 30/04/21.
//

import XCTest
@testable import WeatherApp

class WeatherAppTests: BaseUnitTest {
    
    func testEmptyCityNameEntry(){
        let searchCityVM = SearchCityViewModel.init(delegate: nil)
        searchCityVM.cityName = String.empty
        XCTAssertFalse(searchCityVM.validateCityName())
    }
    
    func testThunderStormWeatherCode(){
        XCTAssert(Utils.sharedInstance.getImageIconNameForWeatherCode(weatherCode: 200) == ImageConstants.thunderStormOne.rawValue)
    }
    
    func testLightRainWeatherCode(){
        XCTAssert(Utils.sharedInstance.getImageIconNameForWeatherCode(weatherCode: 302) == ImageConstants.lightRain.rawValue)
    }
    
    func testShowerWeatherCode(){
        XCTAssert(Utils.sharedInstance.getImageIconNameForWeatherCode(weatherCode: 501) == ImageConstants.shower.rawValue)
    }
    
    func testSnowFourWeatherCode(){
        XCTAssert(Utils.sharedInstance.getImageIconNameForWeatherCode(weatherCode: 601) == ImageConstants.snowFour.rawValue)
    }
    
    func testFogWeatherCode(){
        XCTAssert(Utils.sharedInstance.getImageIconNameForWeatherCode(weatherCode: 701) == ImageConstants.fog.rawValue)
    }

    func testSunnyCode(){
        XCTAssert(Utils.sharedInstance.getImageIconNameForWeatherCode(weatherCode: 800) == ImageConstants.sunny.rawValue)
    }
    
    func testCloudyTwoCode(){
        XCTAssert(Utils.sharedInstance.getImageIconNameForWeatherCode(weatherCode: 801) == ImageConstants.cloudyTwo.rawValue)
    }
    
    func testUnavailableCode(){
        XCTAssert(Utils.sharedInstance.getImageIconNameForWeatherCode(weatherCode: 1001) == ImageConstants.unavailable.rawValue)
    }
}
