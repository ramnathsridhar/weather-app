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
    
    //Function to add a weather model into favourties
    static func updateFavourites(favourite:String?,actionType:PersistenceActionType,completed: @escaping(Error?) -> Void){
        
        guard let favourite = favourite else {
            completed(ErrorMessages.unableToAddFavourite)
            return
        }
        
        retrieveFavourites { (result) in
            switch result{
                case .success(let favourites):
                    var retreivedFavourites = favourites
                    switch actionType {
                        case .add:
                            guard !checkIfCityAddedAsFavourite(cityName: favourite, favouritesList: retreivedFavourites) else {
                                completed(ErrorMessages.alreadyInFavourite)
                                return
                            }
                            retreivedFavourites.append(favourite)
                        case .delete :
                            retreivedFavourites.removeAll {$0 == favourite}
                            }
                completed(addFavourites(weatherData: retreivedFavourites))
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    //Base function to retrieve favourties
    static func retrieveFavourites(completed : @escaping(Result<[String],ErrorMessages>) -> Void){
        guard let favourtiesData = defaults.object(forKey: PersistenceKeys.favourites ) as? Data else {
            completed(.success([]))
            return
        }
        
        //Decode the received data into the model defined
        do{
            let decoder = JSONDecoder.init()
            let favourties = try decoder.decode([String].self, from: favourtiesData)
            completed(.success(favourties))
        }catch{
            completed(.failure(.unableToFetchFavourtie))
        }
    }
    
    //Base function to add favourties
    static func addFavourites(weatherData:[String]) -> ErrorMessages? {
        do {
            let encoder = JSONEncoder.init()
            let encodedFavourties = try encoder.encode(weatherData)
            defaults.setValue(encodedFavourties, forKey: PersistenceKeys.favourites )
            return nil
        } catch  {
            return ErrorMessages.unableToAddFavourite
        }
    }
    
    static func checkIfCityAddedAsFavourite(cityName:String,favouritesList:[String]) -> Bool {
        for cityDetail in favouritesList{
            if cityDetail == cityName {
                return true
            }
        }
        return false
    }
}

