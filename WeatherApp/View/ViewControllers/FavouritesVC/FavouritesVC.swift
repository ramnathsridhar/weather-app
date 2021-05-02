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
    var favouriteList : [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.favouritesTableView.delegate = self
        self.favouritesTableView.dataSource = self
        self.favouritesTableView.register(UINib.init(nibName: "FavouritesTableViewCell", bundle: nil), forCellReuseIdentifier: FavouritesTableViewCell.reuseId)
        self.favouritesTableView.tableFooterView = UIView()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchFavouriteList()
    }
    
    func fetchFavouriteList(){
        PersistenceManager.retrieveFavourites { [weak self](result) in
            switch result {
            case .success(let favouritesList):
                self?.favouriteList = favouritesList
                if favouritesList.isEmpty{
                    self?.noFavourtiesAddedLabel.isHidden = false
                    self?.favouritesTableView.isHidden = true
                    self?.noFavourtiesAddedLabel.bringSubviewToFront(self?.view ?? UIView())
                }else{
                    self?.favouritesTableView.isHidden = false
                    self?.noFavourtiesAddedLabel.isHidden = true
                    self?.favouritesTableView.bringSubviewToFront(self?.view ?? UIView())
                    self?.favouritesTableView.reloadData()
                }
            case .failure(let errorMessage):
                self?.displayErrorAlertPopup(alertTitle: ErrorMessages.errorString.rawValue, alertMessage: errorMessage.rawValue, buttonTitle: AppMessages.okString.rawValue)
            }
        }
    }
}

extension FavouritesVC:UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.favouriteList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.favouritesTableView.dequeueReusableCell(withIdentifier: FavouritesTableViewCell.reuseId) as? FavouritesTableViewCell
        cell?.setCityName(cityName: self.favouriteList?[indexPath.row] ?? String.empty)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityName = favouriteList?[indexPath.row]
        let weatherInformationVC = WeatherInformationVC()
        weatherInformationVC.title = cityName
        weatherInformationVC.weatherDetailsVM = WeatherInformationViewModel.init( cityName: cityName ?? String.empty, cityWeatherdelegate: weatherInformationVC)
        self.navigationController?.pushViewController(weatherInformationVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        let selectedFavourite = favouriteList?[indexPath.row]
        self.favouriteList?.remove(at: indexPath.row)
        self.favouritesTableView.deleteRows(at: [indexPath], with: .fade)
        
        PersistenceManager.updateFavourites(favourite: selectedFavourite, actionType: .delete) { [weak self] (error) in
            if let errorMessage = error {
                self?.displayErrorAlertPopup(alertTitle: ErrorMessages.errorString.rawValue, alertMessage: (errorMessage as? ErrorMessages)?.rawValue ?? String.empty , buttonTitle: AppMessages.okString.rawValue)
                return
            }
        }
    }
}
