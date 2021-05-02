//
//  UIViewController+Ext.swift
//  WeatherApp
//
//  Created by Ramnath Sridhar on 30/04/21.
//

import UIKit

//Way to create variables which can be used in extensions
fileprivate var containerView:UIView!

extension UIViewController{
    
    //To display a loading view when an API hit is made
    func displayLoadingView(){
        containerView = UIView.init(frame: self.view.frame)
        self.view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 8
        
        UIView.animate(withDuration: 0.25) {
            containerView.alpha = 0.8
        }
        
        let activityIndicator = UIActivityIndicatorView.init(style: .large)
        containerView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        
        activityIndicator.startAnimating()
    }
    
    //To dismissloading view
    func dismissLoadingView(){
        DispatchQueue.main.async {
            if containerView != nil{
                containerView.removeFromSuperview()
                containerView = nil
            }
        }
    }
    
    //To display error popup
    func displayAlertPopup(alertTitle:String,alertMessage:String,buttonTitle:String,actionOnClickOfOk:((UIAlertAction) -> Void)? = nil){
        //Create the alert
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle:.alert)

        //Add action to alert
        alert.addAction(UIAlertAction.init(title: buttonTitle, style: .default, handler: actionOnClickOfOk))
        
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    //Function to add chid view controllers in a container view 
    func add(childVC:UIViewController,to containerView:UIView){
            self.addChild(childVC)
            containerView.addSubview(childVC.view)
            childVC.view.frame = containerView.bounds
            childVC.didMove(toParent: self)
    }
}
