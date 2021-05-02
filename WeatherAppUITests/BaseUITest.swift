//
//  BaseUITest.swift
//  WeatherAppUITests
//
//  Created by Ramnath Sridhar on 02/05/21.
//

import XCTest
@testable import WeatherApp

class BaseUITest: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = true
        //Turn off animations while running UI tests
        app.launchArguments.append("UITEST_DISABLE_ANIMATIONS")
        app.launch()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    //The textfield element and the text to be entered is passed
    func typeTextInTextField(textField : XCUIElement,text:String){
        textField.tap()
        textField.clearText()
        textField.typeText(text)
        self.tapKeyBoardReturnButton()
        self.waitToExecuteNextLine(timeOut: 2)
    }
    
    //Done button is tapped on the keypad
    func tapKeyBoardReturnButton(){
        XCUIApplication().keyboards.buttons["return"].tap()
    }
    
    //Wait for a predifned amount of time
    func waitToExecuteNextLine(timeOut:TimeInterval){
        let waitExpectation = expectation(description: "Wait for the specified duration")
        let result = XCTWaiter.wait(for: [waitExpectation], timeout: timeOut)
        if result == XCTWaiter.Result.timedOut{
            XCTAssertTrue(true)
        }else{
           XCTAssertFalse(true)
        }
    }
    
    //Used when element might take time to come up on screen
    func waitForElementToAppear(element : XCUIElement){
        //Predicate to validate , before wait time gets over
        let predicate = NSPredicate(format:"exists == true")
        //Checks if predicate is true for the element
        let expectations = expectation(for: predicate, evaluatedWith: element, handler: nil)
        //Waits for 30s till the element comes on screen
        let result = XCTWaiter().wait(for: [expectations], timeout: 30)
        if result == XCTWaiter.Result.timedOut{
            XCTAssertTrue(true)
        }else{
           XCTAssertFalse(true)
        }
    }
    
}

extension XCUIElement{
    //Check if the elements frame coordiantes are present on screen
    func isVisibleOnScreen() -> Bool{
        guard self.exists && !self.frame.isEmpty else {
            return false
        }
        return XCUIApplication().windows.element(boundBy: 0).frame.contains(self.frame)
    }
    
    //Clears string if text is present in the the element
    func clearText(){
        guard let stringValue = self.value as? String else { return }
        
        var deleteString = String()
        for _ in stringValue{
            deleteString += XCUIKeyboardKey.delete.rawValue
        }
        self.typeText(deleteString)
    }
}
