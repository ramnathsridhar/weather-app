//
//  FavouritesVC.swift
//  WeatherApp
//
//  Created by Ramnath Sridhar on 30/04/21.
//

import UIKit

class FavouritesVC: UIViewController {

    @IBOutlet weak var noFavourtiesAddedLabel: WAPrimaryLabel!
    @IBOutlet weak var favouritesTableView: UITableView!
    
    var favouritesViewModel : FavouritesViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.favouritesTableView.delegate = self
        self.favouritesTableView.dataSource = self
        self.favouritesTableView.register(UINib.init(nibName: "FavouritesTableViewCell", bundle: nil), forCellReuseIdentifier: FavouritesTableViewCell.reuseId)
        self.favouritesTableView.tableFooterView = UIView()
        self.view.backgroundColor = UIColor.init(hexString: ColorConstants.primaryBlueColour)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.favouritesViewModel?.getFavourites()
    }
}

extension FavouritesVC:UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.favouritesViewModel?.favouriteList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.favouritesTableView.dequeueReusableCell(withIdentifier: FavouritesTableViewCell.reuseId) as? FavouritesTableViewCell
        cell?.setCityName(cityName: self.favouritesViewModel?.favouriteList[indexPath.row] ?? String.empty)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityName = self.favouritesViewModel?.favouriteList[indexPath.row]
        let weatherInformationVC = WeatherInformationVC()
        weatherInformationVC.title = cityName
        weatherInformationVC.weatherDetailsVM = WeatherInformationViewModel.init( cityName: cityName ?? String.empty, cityWeatherdelegate: weatherInformationVC)
        self.navigationController?.pushViewController(weatherInformationVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        self.favouritesViewModel?.deleteFavourite(indexOfFavourite: indexPath)
    }
}


extension FavouritesVC : FavouritesDelegate{
    func getFavouritesSuccessful() {
        self.favouritesTableView.isHidden = false
        self.noFavourtiesAddedLabel.isHidden = true
        self.favouritesTableView.bringSubviewToFront(self.view ?? UIView())
        self.favouritesTableView.reloadData()
    }
    
    func deleteFavouriteSuccessful(indexDeleted: IndexPath) {
        self.favouritesTableView.deleteRows(at: [indexDeleted], with: .fade)
    }
    
    func deleteFavouriteFailed(errorMessage: String) {
        self.displayAlertPopup(alertTitle: ErrorMessages.errorString.rawValue, alertMessage: errorMessage , buttonTitle: AppMessages.okString.rawValue)
    }
    
    func noFavouritesAdded() {
        self.noFavourtiesAddedLabel.isHidden = false
        self.favouritesTableView.isHidden = true
        self.noFavourtiesAddedLabel.bringSubviewToFront(self.view ?? UIView())
    }
    
    func getFavouritesFailed(errorMessage: String) {
        self.displayAlertPopup(alertTitle: ErrorMessages.errorString.rawValue, alertMessage: errorMessage, buttonTitle: AppMessages.okString.rawValue)
    }
}
