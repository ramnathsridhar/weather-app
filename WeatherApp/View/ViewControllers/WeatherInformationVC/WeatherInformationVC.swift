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
        PersistenceManager.updateFavourites(favourite: self.weatherDetailsVM?.cityName, actionType: .add) { (error) in
            if let error = error {
                self.displayErrorAlertPopup(alertTitle: ErrorMessages.errorString.rawValue, alertMessage: (error as? ErrorMessages)?.rawValue ?? String.empty, buttonTitle: AppMessages.okString.rawValue)
            }
            self.displayErrorAlertPopup(alertTitle: AppMessages.successString.rawValue, alertMessage: AppMessages.addFavouriteSuccessful.rawValue, buttonTitle: AppMessages.okString.rawValue)
        }
    }
    
    func setupUI(){
        DispatchQueue.main.async {            
        self.add(childVC: CurrentTemperatureVCViewController.init(weatherCode: self.weatherDetailsVM?.cityWeatherDetails?.weather.first?.id ?? 0, currentTemperature: self.weatherDetailsVM?.cityWeatherDetails?.main.temp ?? 0), to: self.currentWeatherDetilsView)
        self.add(childVC: CurrentWeatherDetailsVC.init(maxTemp: self.weatherDetailsVM?.cityWeatherDetails?.main.tempMax ?? 0, minTemp: self.weatherDetailsVM?.cityWeatherDetails?.main.tempMin ?? 0, humidity: self.weatherDetailsVM?.cityWeatherDetails?.main.humidity ?? 0, feelsLike: self.weatherDetailsVM?.cityWeatherDetails?.main.feelsLike ?? 0, sunriseTime: self.weatherDetailsVM?.cityWeatherDetails?.sys.sunrise ?? 0, sunsetTime: self.weatherDetailsVM?.cityWeatherDetails?.sys.sunset ?? 0, updatedTime: self.weatherDetailsVM?.cityWeatherDetails?.dt ?? 0), to: self.weatherDetailsView)
        }
    }
    
    func add(childVC:UIViewController,to containerView:UIView){
            self.addChild(childVC)
            containerView.addSubview(childVC.view)
            childVC.view.frame = containerView.bounds
            childVC.didMove(toParent: self)
    }
}

extension WeatherInformationVC : CityWeatherDelegate{
    func getWeatherForCitySuccessful(weatherDetails: WeatherModel) {
        self.dismissLoadingView()
        self.setupUI()
    }
    
    func getWeatherForCityFailed(errorMessage: String) {
        self.dismissLoadingView()
        self.displayErrorAlertPopup(alertTitle: ErrorMessages.errorString.rawValue, alertMessage: errorMessage, buttonTitle: AppMessages.okString.rawValue) { (action) in
            self.navigationController?.popViewController(animated: true)
        }
    }
}
