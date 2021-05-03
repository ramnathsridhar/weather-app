//
//  WeatherAppUITests.swift
//  WeatherAppUITests
//
//  Created by Ramnath Sridhar on 30/04/21.
//

import XCTest
@testable import WeatherApp

class WeatherAppUITests: BaseUITest {    
    func testEmptyCityNameEntry(){
        let cityTextField = app.textFields["cityTextField"]
        cityTextField.tap()
        typeTextInTextField(textField: cityTextField, text: "")
        app.alerts["Error"].scrollViews.otherElements.buttons["OK"].tap()
        XCTAssert(app.staticTexts["Search Weather"].exists)
    }
    
    func testInvalidCityNameEntry(){
        let cityTextField = app.textFields["cityTextField"]
        cityTextField.tap()
        typeTextInTextField(textField: cityTextField, text: "GG")
        app.alerts["Error"].scrollViews.otherElements.buttons["OK"].tap()
        XCTAssert(app.staticTexts["Search Weather"].exists)
    }
    
    func testValidCityNameEntry(){
        let cityTextField = app.textFields["cityTextField"]
        cityTextField.tap()
        typeTextInTextField(textField: cityTextField, text: "Chennai")
        XCUIApplication().navigationBars["Chennai"].staticTexts["Chennai"].exists
    }
}
