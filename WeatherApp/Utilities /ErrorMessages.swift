//
//  ErrorMessages.swift
//  WeatherApp
//
//  Created by Ramnath Sridhar on 30/04/21.
//

import Foundation

enum ErrorMessages : String , Error {
    case invalidCity = "This city name created invalid request . Please try again"
    case unableToCompleteRequest = "Unable to complete request. Please try again."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from server is invalid."
    case unableToAddFavourite = "Unable to add  city to favourties."
    case alreadyInFavourite = "City already added as favourtie"
    case enterValidCityName = "Please enter a valid city name"
    case errorString = "Error"
    case unableToFetchFavourtie = "Error trying to fetch favourtie . Please try again ."
}
