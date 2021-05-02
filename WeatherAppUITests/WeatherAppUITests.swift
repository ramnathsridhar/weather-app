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
    
    func testAddAndDeleteFavourite(){
        let cityTextField = app.textFields["cityTextField"]
        cityTextField.tap()
        typeTextInTextField(textField: cityTextField, text: "Chennai")
        XCUIApplication().navigationBars["Chennai"].staticTexts["Chennai"].tap()
        app.navigationBars["Chennai"].buttons["Add"].tap()
        app.alerts["Success"].scrollViews.otherElements.buttons["OK"].tap()
        app.tabBars["Tab Bar"]/*@START_MENU_TOKEN@*/.buttons["favouriteTabBarButton"]/*[[".buttons[\"Favorites\"]",".buttons[\"favouriteTabBarButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let favouritestableviewTable = app.tables["favouritesTableView"]
        favouritestableviewTable/*@START_MENU_TOKEN@*/.staticTexts["Chennai"]/*[[".cells.staticTexts[\"Chennai\"]",".staticTexts[\"Chennai\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        favouritestableviewTable/*@START_MENU_TOKEN@*/.buttons["Delete"]/*[[".cells.buttons[\"Delete\"]",".buttons[\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssert(app.staticTexts["No Favourties Added"].exists)
    }
    
    func testViewFavouriteWeather(){
        let cityTextField = app.textFields["cityTextField"]
        cityTextField.tap()
        typeTextInTextField(textField: cityTextField, text: "Chennai")
        XCUIApplication().navigationBars["Chennai"].staticTexts["Chennai"].tap()
        app.navigationBars["Chennai"].buttons["Add"].tap()
        app.alerts["Success"].scrollViews.otherElements.buttons["OK"].tap()
        app.tabBars["Tab Bar"]/*@START_MENU_TOKEN@*/.buttons["favouriteTabBarButton"]/*[[".buttons[\"Favorites\"]",".buttons[\"favouriteTabBarButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let favouritestableviewTable = app.tables["favouritesTableView"]
        favouritestableviewTable/*@START_MENU_TOKEN@*/.staticTexts["Chennai"]/*[[".cells.staticTexts[\"Chennai\"]",".staticTexts[\"Chennai\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCUIApplication().navigationBars["Chennai"].buttons["Favourites"].tap()
        favouritestableviewTable/*@START_MENU_TOKEN@*/.staticTexts["Chennai"]/*[[".cells.staticTexts[\"Chennai\"]",".staticTexts[\"Chennai\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        favouritestableviewTable/*@START_MENU_TOKEN@*/.buttons["Delete"]/*[[".cells.buttons[\"Delete\"]",".buttons[\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssert(app.staticTexts["No Favourties Added"].exists)
    }
    
    
    func testAddPreExistingCityAsFavourite(){
        let cityTextField = app.textFields["cityTextField"]
        cityTextField.tap()
        typeTextInTextField(textField: cityTextField, text: "Chennai")
        XCUIApplication().navigationBars["Chennai"].staticTexts["Chennai"].tap()
        app.navigationBars["Chennai"].buttons["Add"].tap()
        app.alerts["Success"].scrollViews.otherElements.buttons["OK"].tap()
        app.navigationBars["Chennai"].buttons["Add"].tap()
        let elementsQuery = app.alerts["Error"].scrollViews.otherElements
        elementsQuery.staticTexts["City already added as favourtie"].tap()
        app.alerts["Error"].scrollViews.otherElements.buttons["OK"].tap()
        app.tabBars["Tab Bar"]/*@START_MENU_TOKEN@*/.buttons["favouriteTabBarButton"]/*[[".buttons[\"Favorites\"]",".buttons[\"favouriteTabBarButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let favouritestableviewTable = app.tables["favouritesTableView"]
        favouritestableviewTable/*@START_MENU_TOKEN@*/.staticTexts["Chennai"]/*[[".cells.staticTexts[\"Chennai\"]",".staticTexts[\"Chennai\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCUIApplication().navigationBars["Chennai"].buttons["Favourites"].tap()
        favouritestableviewTable/*@START_MENU_TOKEN@*/.staticTexts["Chennai"]/*[[".cells.staticTexts[\"Chennai\"]",".staticTexts[\"Chennai\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        favouritestableviewTable/*@START_MENU_TOKEN@*/.buttons["Delete"]/*[[".cells.buttons[\"Delete\"]",".buttons[\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssert(app.staticTexts["No Favourties Added"].exists)
    }
}
