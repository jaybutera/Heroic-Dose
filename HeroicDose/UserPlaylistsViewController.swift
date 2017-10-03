//
//  UserPlaylistsViewController.swift
//  HeroicDose
//


import UIKit
class UserPlaylistsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "User Playlists"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(SSASideMenu.presentLeftMenuViewController))
        
        
        
    }
        
}
