//
//  CurrentWeatherDetailsVC.swift
//  WeatherApp
//
//  Created by Ramnath Sridhar on 01/05/21.
//

import UIKit

class CurrentWeatherDetailsVC: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var maximumTempLabel: WADescriptionLabel!
    @IBOutlet weak var minimumTempLabel: WADescriptionLabel!
    @IBOutlet weak var humidityLabel: WADescriptionLabel!
    @IBOutlet weak var feelsLikeLabel: WADescriptionLabel!
    @IBOutlet weak var sunriseTimeLabel: WADescriptionLabel!
    @IBOutlet weak var sunsetTimeLabel: WADescriptionLabel!
    @IBOutlet weak var updatedTimeLabel: WASecondaryLabel!
    
    var maxTemp : Double = 0
    var minTemp : Double = 0
    var humidity: Int = 0
    var feelsLike: Double = 0
    var sunriseTime: Int = 0
    var sunsetTime: Int = 0
    var updatedTime: Int = 0

    init(maxTemp:Double,minTemp:Double,humidity:Int,feelsLike:Double,sunriseTime:Int,sunsetTime:Int,updatedTime:Int) {
        super.init(nibName: nil, bundle: nil)
        self.maxTemp = maxTemp
        self.minTemp = minTemp
        self.humidity = humidity
        self.feelsLike = feelsLike
        self.sunriseTime = sunriseTime
        self.sunsetTime = sunsetTime
        self.updatedTime = updatedTime
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureDescritpionLabels()
    }
    
    func configureDescritpionLabels(){
        self.maximumTempLabel.text = AppMessages.maxTempIs.rawValue + String.space + String.init(describing: self.maxTemp).getTemperatureInCelcius()
        self.minimumTempLabel.text = AppMessages.minTempIs.rawValue + String.space + String.init(describing: self.minTemp).getTemperatureInCelcius()
        self.humidityLabel.text = AppMessages.humidityIs.rawValue + String.space + String.init(describing: self.humidity) + String.percentage
        self.feelsLikeLabel.text = AppMessages.feelsLike.rawValue + String.space + String.init(describing: self.feelsLike).getTemperatureInCelcius()
        self.sunriseTimeLabel.text = AppMessages.sunriseExpectedAt.rawValue + String.space + String.init(describing: self.sunriseTime).createTime()
        self.sunsetTimeLabel.text = AppMessages.sunsetExpectedAt.rawValue + String.space + String.init(describing: self.sunsetTime).createTime()
        self.updatedTimeLabel.text = AppMessages.updatedAt.rawValue + String.space + String.init(describing: self.updatedTime).createDateTime()
    }
}
