//
//  WADescriptionLabel.swift
//  WeatherApp
//
//  Created by Ramnath Sridhar on 30/04/21.
//

import UIKit

class WADescriptionLabel: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configure()
    }
    
    private func configure(){
        self.textColor = .white
        self.textAlignment = .center
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        self.backgroundColor = UIColor.init(hexString: ColorConstants.secondaryBlueColour, alpha: 0.5)
        self.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.90
        self.lineBreakMode = .byTruncatingTail
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
