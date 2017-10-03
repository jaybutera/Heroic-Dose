//
//  HomeViewController.swift
//  HeroicDose
//


import UIKit


class HomeRootViewController: SSASideMenu {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let vc = ViewController()
        let homeVC = BaseNavigationViewController(rootViewController: vc)
        let menuVC = MenuViewController(nibName: "MenuViewController", bundle: nil)
        
        contentViewController = homeVC
        leftMenuViewController = menuVC
        
        configure(SSASideMenu.MenuViewEffect(fade: true, scale: true, scaleBackground: false))
        configure(SSASideMenu.ContentViewEffect(alpha: 1.0, scale: 0.7))
        configure(SSASideMenu.ContentViewShadow(enabled: true, color: UIColor.black, opacity: 0.6, radius: 6.0))
    }
    
    
}
