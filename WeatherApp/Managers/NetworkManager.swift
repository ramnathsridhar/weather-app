//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Ramnath Sridhar on 30/04/21.
//

import UIKit

class NetworkManager {
    //Making it a shared isntance so that the same class can be used from accross the app
    static let sharedInstance = NetworkManager()
    //Base URL in which the user input will be entered
    private let baseURL = "https://api.openweathermap.org/data/2.5/weather?q="
    //API key for the API call
    private let apikey = "f1a1d10ee152124aef3fdcfc04544f31"
    //Cache to store images
    let cache = NSCache<NSString,UIImage>()
    
    //Making the init as private to allow only the singleton class to be used
    private init(){}
    
    //API call to get the weather for the city name entered
    func getWeatherForCity(cityName:String,completed:@escaping (Result<WeatherModel,ErrorMessages>) -> Void){
        //Adding the city name and the api key to the URL
        let endpoint = baseURL + "\(cityName)&appid=\(apikey)"

        //Converting the URL string formed above into a URL
        guard let finalUrl = URL.init(string: endpoint) else {
            completed(.failure(ErrorMessages.invalidCity))
            return
        }
        
        //The following URLSession task is created to make the API hit
        let task = URLSession.shared.dataTask(with: finalUrl) { (data, response, error) in
            //First check is to see if there is a error returned
            if let _ = error{
                completed(.failure(.invalidResponse))
                return
            }
            //Second check is made to confirm if the HTTP resposne code is 200
            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            //Third check is to verify if data is valid
            guard let data = data else{
                completed(.failure(.invalidData))
                return
            }
            //Decode the received data into the model defined
            do{
                let decoder = JSONDecoder.init()
                let followers = try decoder.decode(WeatherModel.self, from: data)
                completed(.success(followers))
            }catch{
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
