# weather-app

Project description :
iOS Weather app built using OpenWeather API to display the current weather of a city entered by user and manage (add/remove) a list of favourite cities . The default unit of measurement used is metric .

Technical information :
1. Development Language Used :  Swift 5
2. Current Version : 1.0
3. Build : 1
4. Deployment target : iOS 14.4
5. XcodeVersion : 12.4
6. Supported Devices : iPhone , iPad
7. Third Party Software : OpenWeather API
8. Github URL : https://github.com/ramnathsridhar/weather-app.git

Steps to run project :
1. Download proejct from github URL
2. Open WeatherApp.xcodeproj
3. Run the project

App Usage :
1. On launching the app , use can enter a city name in the textfield provided and click on "Search Weather" button or tap on return in the keyboard .
2. If the city name is valid and the weather details are successfuly retrieved , user is taken to the next page where the current weather details are listed .
3. If user wishes to add the city as a favourite , the right bar button in the navbar needs to be clicked 
4. The result of the operation is shown as a popup 
5. If the user wished to see the list of favourite cities , the "Favorites" tab needs to be selected 
6. The list of favourite cities is listed in this page , if previously added
7. If user wishes to delete a favourtie city , the city needs to be selected and swiped to the right , to display the delete option . On clicking of delete the favourite city is removed from the list

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

Project Structure : 
1.  Extensions : Contains the extensions of String , UIViewController and UIColour
2. Utilties : Contains constants used in app and utiity functions 
3. Managers : Contains the manager classes for networking and persistance
4. ViewModel : Contains the view model of the corresponding view controllers
5. Model : Contains the strcuture of the response json
6. View : Contains the view controller and the custom views which have been used in the app 
7. WeatherAppTests : Contains the Unit tests to be run on the app
8. WeatherAppUITests : Contains the UI tests to be run on he app

Scope of Improvement :
1. Cache and display last update weather information in case of network unavailablity 
2. Display hourly and daily weather forecase
3. Take current user location
4. Add addiitonal Unit and UI tests
5. Provide option to choose the unit of measurement 
