//
//  FavouritesTableViewCell.swift
//  WeatherApp
//
//  Created by Ramnath Sridhar on 01/05/21.
//

import UIKit

class FavouritesTableViewCell: UITableViewCell {

    @IBOutlet weak var cityName: WAFavouriteTableViewLabel!
    @IBOutlet weak var cityInitialLabel: UILabel!
    
    static let reuseId = "favouriteCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .clear
        self.accessoryType = .disclosureIndicator
        self.tintColor = .white
        self.cityInitialLabel.layer.masksToBounds = true
        self.cityInitialLabel.layer.cornerRadius = 5
        self.cityInitialLabel.backgroundColor = .white
    }
    
    func setCityName(cityName:String){
        self.cityName.text = cityName
        self.cityInitialLabel.text = String(describing: cityName.prefix(1)) 
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
