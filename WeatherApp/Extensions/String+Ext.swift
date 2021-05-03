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
    public static let degreeCelsiusSybmol = "ºC"
    
    func getTemperatureInCelcius() -> String {
        let tempInCelsius = (Double(self) ?? 0) - 273
        return String(format: "%.1f", tempInCelsius) + String.degreeCelsiusSybmol
    }
    
    func createDateTime() -> String {
        var strDate = String.empty
        if let unixTime = Double(self) {
            let date = Date(timeIntervalSince1970: unixTime)
            let dateFormatter = DateFormatter()
            // get current TimeZone
            let timezone = TimeZone.current.abbreviation() ?? "CET"
            //Set timezone
            dateFormatter.timeZone = TimeZone(abbreviation: timezone)
            dateFormatter.locale = NSLocale.current
            //Specify format required
            dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
            strDate = dateFormatter.string(from: date)
        }
        return strDate
    }
    
    func createTime() -> String {
        var strDate = String.empty
        if let unixTime = Double(self) {
            let date = Date(timeIntervalSince1970: unixTime)
            let dateFormatter = DateFormatter()
            // get current TimeZone
            let timezone = TimeZone.current.abbreviation() ?? "CET"
            //Set timezone that you want
            dateFormatter.timeZone = TimeZone(abbreviation: timezone)
            dateFormatter.locale = NSLocale.current
            //Specify format required
            dateFormatter.dateFormat = "HH:mm"
            strDate = dateFormatter.string(from: date)
        }
        return strDate
    }
}
