//
//  String+Ext.swift
//  WeatherApp
//
//  Created by Ramnath Sridhar on 30/04/21.
//

import Foundation

extension String{
    public static let space = " "
    public static let empty = ""
    public static let hash = "#"
    public static let percentage = "%"
    public static let degreeCelciusSybmol = "ºC"
    
    func getTemperatureInCelcius() -> String {
        let tempInCelcius = (Double(self) ?? 0) - 273
        return String(format: "%.1f", tempInCelcius) + String.degreeCelciusSybmol
    }
    
    func createDateTime() -> String {
        var strDate = String.empty
        if let unixTime = Double(self) {
            let date = Date(timeIntervalSince1970: unixTime)
            let dateFormatter = DateFormatter()
            let timezone = TimeZone.current.abbreviation() ?? "CET"  // get current TimeZone abbreviation or set to CET
            dateFormatter.timeZone = TimeZone(abbreviation: timezone) //Set timezone that you want
            dateFormatter.locale = NSLocale.current
            dateFormatter.dateFormat = "dd.MM.yyyy HH:mm" //Specify your format that you want
            strDate = dateFormatter.string(from: date)
        }
        return strDate
    }
    
    func createTime() -> String {
        var strDate = String.empty
        if let unixTime = Double(self) {
            let date = Date(timeIntervalSince1970: unixTime)
            let dateFormatter = DateFormatter()
            let timezone = TimeZone.current.abbreviation() ?? "CET"  // get current TimeZone abbreviation or set to CET
            dateFormatter.timeZone = TimeZone(abbreviation: timezone) //Set timezone that you want
            dateFormatter.locale = NSLocale.current
            dateFormatter.dateFormat = "HH:mm" //Specify your format that you want
            strDate = dateFormatter.string(from: date)
        }
        return strDate
    }
    
}
