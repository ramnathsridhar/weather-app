//
//  WAFavouriteTableViewLabel.swift
//  WeatherApp
//
//  Created by Ramnath Sridhar on 01/05/21.
//

import UIKit

class WAFavouriteTableViewLabel: UILabel {
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            self.configure()
        }
        
        private func configure(){
            self.textColor = .white
            self.backgroundColor = .clear
            self.font = UIFont.systemFont(ofSize: 25, weight: .bold)
            self.adjustsFontSizeToFitWidth = true
            self.minimumScaleFactor = 0.90
            self.lineBreakMode = .byTruncatingTail
            self.translatesAutoresizingMaskIntoConstraints = false
        }
    }
