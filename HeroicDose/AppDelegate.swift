//
//  AppDelegate.swift
//  HeroicDose
//

import UIKit
import SwiftyUserDefaults
import Soundcloud

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, SSASideMenuDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        //MARK : Setup SSASideMenu
       
        
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        let sideMenu = SSASideMenu(contentViewController: BaseNavigationViewController(rootViewController: DrugViewController()), leftMenuViewController: MenuViewController())
        sideMenu.backgroundImage = UIImage(named: "Background.jpg")
        //sideMenu.configure(SSASideMenu.MenuViewEffect(fade: true, scale: true, scaleBackground: false))
        sideMenu.configure(SSASideMenu.MenuViewEffect(fade: true, scale: true, scaleBackground: true, parallaxEnabled: true, bouncesHorizontally: false, statusBarStyle: .hidden))
        sideMenu.configure(SSASideMenu.ContentViewEffect(alpha: 1.0, scale: 0.7))
        sideMenu.configure(SSASideMenu.ContentViewShadow(enabled: true, color: UIColor.clear, opacity: 0.6, radius: 6.0))
        sideMenu.delegate = self
        
        
        window?.rootViewController = sideMenu
        window?.makeKeyAndVisible()
        
        
        let x = Defaults[.songs]
       
        if ( x == nil) {
            
            Defaults[.songs] = [Song]()
            Defaults.synchronize()
           
            
        } else {
            Defaults[.songs] = [Song]()
            print ("already exists")
        }
        
        Soundcloud.clientIdentifier = "7467688f360c6055fb679c3bd739acbc"
        Soundcloud.clientSecret  = "8cd5fb0bd4653074d8b6b6a352d81ac5"
        // Soundcloud.clientIdentifier = "ebc8467d2ae245181b131d34b7273c20"
        //Soundcloud.clientSecret  = "43f22ebcd1cadc4274e54ee779f49f9b"
        Soundcloud.redirectURI = "soundcloud://soundcloud/callback"
       
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

