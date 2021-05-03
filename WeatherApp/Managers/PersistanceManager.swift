//
//  PersistanceManager.swift
//  WeatherApp
//
//  Created by Ramnath Sridhar on 01/05/21.

import Foundation

enum PersistenceManager{
    static private let defaults = UserDefaults.standard
    
    enum PersistenceKeys{
        static let favourites = "favourites"
    }
    
    enum PersistenceActionType {
        case add
        case delete
    }
    
    //Function to update the list of favourites based on action type
    static func updateFavourites(favourite:String?,actionType:PersistenceActionType,completed: @escaping(Error?) -> Void){
        
        guard let favourite = favourite else {
            completed(ErrorMessages.unableToAddFavourite)
            return
        }
        //First the list of favourites is retieved
        retrieveFavourites { (result) in
            switch result{
                case .success(let favourites):
                    var retreivedFavourites = favourites
                    switch actionType {
                        case .add:
                            //If action type is add , favourite list is checked to see if it contains city name
                            guard !checkIfCityAddedAsFavourite(cityName: favourite, favouritesList: retreivedFavourites) else {
                                completed(ErrorMessages.alreadyInFavourite)
                                return
                            }
                            retreivedFavourites.append(favourite)
                        case .delete :
                            //If action type is delete , the city name is deleted from tha favourite list
                            retreivedFavourites.removeAll {$0 == favourite}
                            }
                completed(addFavourites(weatherData: retreivedFavourites))
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    //Base function to retrieve favourites
    static func retrieveFavourites(completed : @escaping(Result<[String],ErrorMessages>) -> Void){
        guard let favouritesData = defaults.object(forKey: PersistenceKeys.favourites ) as? Data else {
            completed(.success([]))
            return
        }
        
        //Decode the received data into the model defined
        do{
            let decoder = JSONDecoder.init()
            let favourites = try decoder.decode([String].self, from: favouritesData)
            completed(.success(favourites))
        }catch{
            completed(.failure(.unableToFetchFavourtie))
        }
    }
    
    //Base function to add favourites
    static func addFavourites(weatherData:[String]) -> ErrorMessages? {
        do {
            let encoder = JSONEncoder.init()
            let encodedFavourites = try encoder.encode(weatherData)
            defaults.setValue(encodedFavourites, forKey: PersistenceKeys.favourites )
            return nil
        } catch  {
            return ErrorMessages.unableToAddFavourite
        }
    }
    
    //Check if city name is already added in the favourites array
    static func checkIfCityAddedAsFavourite(cityName:String,favouritesList:[String]) -> Bool {
        if favouritesList.contains(cityName){
            return true
        }else{
            return false
        }
    }
}

