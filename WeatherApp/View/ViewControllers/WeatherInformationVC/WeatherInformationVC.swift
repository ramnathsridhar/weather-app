//
//  WeatherInformationVC.swift
//  WeatherApp
//
//  Created by Ramnath Sridhar on 30/04/21.
//

import UIKit

class WeatherInformationVC: UIViewController {

    
    @IBOutlet public var currentWeatherDetilsView:UIView!
    @IBOutlet public var weatherDetailsView:UIView!

    var weatherDetailsVM:WeatherInformationViewModel?

    
    override func viewDidLoad() {
        self.displayLoadingView()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configureNavigationController()
        self.getWeatherDetailsForCity()
    }
    
    func getWeatherDetailsForCity(){
        self.weatherDetailsVM?.getWeatherForCity()
    }
    
    func configureNavigationController(){
        let addFavButton = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addFavButtonTapped))
        self.navigationItem.rightBarButtonItem = addFavButton
    }

    @objc func addFavButtonTapped(){
        self.weatherDetailsVM?.addFavourite()
    }
    
    func setupUI(){
        DispatchQueue.main.async {            
            self.view.backgroundColor = UIColor.init(hexString: ColorConstants.primaryBlueColour)
            
        //Adding the current temperature and weather image
        self.add(childVC: CurrentTemperatureVCViewController.init(weatherCode: self.weatherDetailsVM?.cityWeatherDetails?.weather.first?.id ?? 0, currentTemperature: self.weatherDetailsVM?.cityWeatherDetails?.main.temp ?? 0), to: self.currentWeatherDetilsView)
            
        //Adding the additional weather details for the city with corresponding labels on screen
        self.add(childVC: CurrentWeatherDetailsVC.init(maxTemp: self.weatherDetailsVM?.cityWeatherDetails?.main.tempMax ?? 0, minTemp: self.weatherDetailsVM?.cityWeatherDetails?.main.tempMin ?? 0, humidity: self.weatherDetailsVM?.cityWeatherDetails?.main.humidity ?? 0, feelsLike: self.weatherDetailsVM?.cityWeatherDetails?.main.feelsLike ?? 0, sunriseTime: self.weatherDetailsVM?.cityWeatherDetails?.sys.sunrise ?? 0, sunsetTime: self.weatherDetailsVM?.cityWeatherDetails?.sys.sunset ?? 0, updatedTime: self.weatherDetailsVM?.cityWeatherDetails?.dt ?? 0), to: self.weatherDetailsView)
        }
    }
}

extension WeatherInformationVC : CityWeatherDelegate{
    func addFavouriteSuccessul() {
        self.displayAlertPopup(alertTitle: AppMessages.successString.rawValue, alertMessage: AppMessages.addFavouriteSuccessful.rawValue, buttonTitle: AppMessages.okString.rawValue)
    }
    
    func addFavouriteFailed(errorMessage: String) {
        self.displayAlertPopup(alertTitle: ErrorMessages.errorString.rawValue, alertMessage: errorMessage, buttonTitle: AppMessages.okString.rawValue)
    }
    
    func getWeatherForCitySuccessful(weatherDetails: WeatherModel) {
        self.dismissLoadingView()
        self.setupUI()
    }
    
    func getWeatherForCityFailed(errorMessage: String) {
        self.dismissLoadingView()
        self.displayAlertPopup(alertTitle: ErrorMessages.errorString.rawValue, alertMessage: errorMessage, buttonTitle: AppMessages.okString.rawValue) { (action) in
            self.navigationController?.popViewController(animated: true)
        }
    }
}
