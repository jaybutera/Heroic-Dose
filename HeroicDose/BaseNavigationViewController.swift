//
//  BaseNavigationViewController.swift
//  HeroicDose

import UIKit

class BaseNavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationBar.tintColor = UIColor(red: 102, green: 51, blue: 153, alpha: 1.0)
        navigationBar.tintColor = UIColor.white
        navigationBar.barStyle = UIBarStyle.black
        navigationBar.isTranslucent = true
        navigationBar.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        navigationBar.shadowImage = UIImage()
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        //navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        //navigationBar.shadowImage = UIImage()
        
      
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
extension UINavigationBar {
    func transparentNavigationBar() {
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
        self.isTranslucent = true
    }
}
