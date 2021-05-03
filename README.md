# weather-app

Project description :
iOS Weather app built using OpenWeather API to display the current weather of a city entered by user .  The unit of measurement used is metric .

Technical information :
1. Development Language Used :  Swift 5
2. Current Version : 1.0
3. Build : 1
4. Deployment target : iOS 14.4
5. Supported Devices : iPhone , iPad
6. Third Party Software : OpenWeather API
7. Github URL : https://github.com/ramnathsridhar/weather-app.git

Steps to run project :
1. Download proejct from github URL
2. Open WeatherApp.xcodeproj
3. Run the project

iOS Development Technologies and Concepts used :
1.   MVVM Architecture
2.   Depenedency Injection
3.   Delegate Protocol Communication Patterns
4.   Network calls using URLSession
5.   Animations
6.   UIKit
7.   Autolayout
8.   Persistance using UserDefaults
9.   Singleton design pattern
10. Unit and UI tests using XCTest and XCUITest
11. Extensions
12. Resuable Views

Future Improvements :
1. Cache and display last update weather information in case of network unavailablity 
2. Display hourly and daily weather forecase
3. Take current user location
4. Add addiitonal Unit and UI tests
5. Provide option to choose the unit of measurement 

Project Structure : 

 Extensions : Contains the extensions of String , UIViewController and UIColour

 Utilties : Contains constants used in app and utiity functions 

 Managers : Contains the manager classes for networking and persistance

 ViewModel : Contains the view model of the corresponding view controllers

 Model : Contains the strcuture of the response json

 View : Contains the view controller and the custom views which have been used in the app 

 WeatherAppTests : Contains the Unit tests to be run on the app

 WeatherAppUITests : Contains the UI tests to be run on he app

