//
//  UIView+Ext.swift
//  WeatherApp
//
//  Created by Ramnath Sridhar on 30/04/21.
//

import UIKit

extension UIView{
    func createGradientLayer(topColor:UIColor,bottomColor:UIColor) {
        var gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [topColor, bottomColor]
        self.layer.addSublayer(gradientLayer)
    }
    
    func setGradientBackground(hexCodeOfColorOne:UIColor,hexCodeOfColorTwo:UIColor) {

        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [
            hexCodeOfColorOne,
            hexCodeOfColorTwo
        ]
        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 0, y: 0)
        layer.insertSublayer(gradient, at: 0)
    }
}
