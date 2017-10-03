//
//  ViewController.swift
//  HeroicDose
//

import UIKit
import Soundcloud

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(SSASideMenu.presentLeftMenuViewController))
    }
    
    @IBAction func Login(_ sender: Any) {
        Soundcloud.clientIdentifier = "7467688f360c6055fb679c3bd739acbc"
          Soundcloud.clientSecret  = "8cd5fb0bd4653074d8b6b6a352d81ac5"
      // Soundcloud.clientIdentifier = "ebc8467d2ae245181b131d34b7273c20"
      //Soundcloud.clientSecret  = "43f22ebcd1cadc4274e54ee779f49f9b"
        Soundcloud.redirectURI = "soundcloud://soundcloud/callback"
        
        
/*
 let vc = LoginViewController()
 self.navigationController?.pushViewController(vc, animated: true)
 
 Soundcloud.login(in: vc) {(response) in
 
 
 print(response)
 
 
 }
*/
        
 
                    /*
    
                let vc = PlayerViewController()
                vc.songUrl = posts.first?.url
                var copy = posts
                copy.removeFirst()
                vc.songs = copy
                self.navigationController?.pushViewController(vc, animated: true)
 */
        
        
        
        
        // let vc = PlayerViewController()
        // self.navigationController?.pushViewController(vc, animated: true)
        
        /*
         let vc = LoginViewController()
         self.navigationController?.pushViewController(vc, animated: true)
         
         Soundcloud.login(in: vc) {(response) in
         
         
         print(response)
         
         
         }
         
         
         Soundcloud.resolve(URI: "https://soundcloud.com/superduperkylemusic/kyle-ispy-feat-lil-yachty") { (response) in
         
         print(response)
         //print(response.response.result?.tracks?.count)
         //print(response.response.result?.tracks?[0].streamURL)
         }
         
         Track.search(queries: [.queryString("enough" + " " + "flume")]) { (scresponse) in
         
         for song in scresponse.response.result ?? [] {
         let scid = song.identifier.description
         let name = song.title
         let artist = song.createdBy.fullname
         let album = song.artworkImageURL.miniURL
         
         // print((name, artist, album, scid))
         // self.results.append((name, artist, album, scid))
         }
         
         
         
         
         }
         */
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

