//
//  CurrentTemperatureVCViewController.swift
//  WeatherApp
//
//  Created by Ramnath Sridhar on 01/05/21.
//

import UIKit

class CurrentTemperatureVCViewController: UIViewController {
    
    @IBOutlet weak var currentWeatherConditionImageView: UIImageView!
    @IBOutlet weak var currentTemperatureLabel: WAPrimaryLabel!
    
    var weatherCode : Int = 0
    var currentTemperature : Double = 0
        
    init(weatherCode:Int,currentTemperature:Double) {
        super.init(nibName: nil, bundle: nil)
        self.weatherCode = weatherCode
        self.currentTemperature = currentTemperature
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.currentWeatherConditionImageView.image = UIImage.init(named: Utils.sharedInstance.getImageIconNameForWeatherCode(weatherCode: weatherCode))
        self.currentTemperatureLabel.text = String(describing: self.currentTemperature).getTemperatureInCelcius()
        self.setUpAnimtation()
    }
    
    func setUpAnimtation() {
        UIView.animate(withDuration: 1.5, delay: 0.75, options: [.repeat,.autoreverse]) {
            self.currentWeatherConditionImageView.transform = self.currentWeatherConditionImageView.transform.rotated(by: .pi * 2)
        } completion: { (completed) in
            print(completed)
        }
    }
}
