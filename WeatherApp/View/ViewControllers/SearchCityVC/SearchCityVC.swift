//
//  SearchCityVC.swift
//  WeatherApp
//
//  Created by Ramnath Sridhar on 30/04/21.
//

import UIKit

class SearchCityVC: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var cityNameTextField: UITextField!
    
    var searchCityViewModel:SearchCityViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.cityNameTextField.delegate = self
        self.createTapGestureToDismissKeyboard()
    }
    
    func setupUI(){
        self.view.backgroundColor = UIColor.init(hexString: ColorConstants.primaryBlueColour)
        self.logoImageView.image = UIImage.init(named: ImageConstants.globeIcon.rawValue)
        self.cityNameTextField.layer.cornerRadius = 10
        self.submitButton.layer.cornerRadius = 10
        self.submitButton.setTitleColor(UIColor.init(hexString: ColorConstants.primaryBlueColour), for: .normal)
        self.setUpAnimation()
    }
    
    func setUpAnimation() {
        UIView.animate(withDuration: 1.5, delay: 0, options: [.repeat,.autoreverse]) {
            self.logoImageView.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
        } completion: { (completed) in
            print(completed)
        }
    }
    
    //Function to dismiss the keyboard when tapped on the view
    func createTapGestureToDismissKeyboard(){
        let tapGesture = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func submitButtonClicked(_ sender: Any) {
        self.view.endEditing(true)
        self.searchCityViewModel?.getWeatherForCity()
    }
}

extension SearchCityVC: SearchCityNameDelegate{
    func searchForCitySuccessful() {
            let weatherInformationVC = WeatherInformationVC()
            weatherInformationVC.title = self.searchCityViewModel?.cityName
            weatherInformationVC.weatherDetailsVM = WeatherInformationViewModel.init( cityName: self.searchCityViewModel?.cityName ?? String.empty, cityWeatherdelegate: weatherInformationVC)
            self.navigationController?.pushViewController(weatherInformationVC, animated: true)
    }
    
    func searchForCityFailed(errorMessage: String) {
        self.displayAlertPopup(alertTitle: ErrorMessages.errorString.rawValue, alertMessage: errorMessage, buttonTitle: AppMessages.okString.rawValue)
    }
}

extension SearchCityVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.searchCityViewModel?.cityName = self.cityNameTextField.text ?? String.empty
        self.searchCityViewModel?.getWeatherForCity()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.searchCityViewModel?.cityName = self.cityNameTextField.text ?? String.empty
    }
}
