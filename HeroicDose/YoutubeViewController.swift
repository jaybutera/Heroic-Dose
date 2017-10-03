//
//  YoutubeViewController.swift
//  HeroicDose
//

import UIKit
import XCDYouTubeKit

class YoutubeViewController:UIViewController {
    
    
    @IBOutlet var playerView: UIView!
    
    var player:AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playVideo()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func playVideo () {
        
        
        let videoPlayer = XCDYouTubeVideoPlayerViewController(videoIdentifier: "9bZkp7q19f0")
        
        //self.presentMoviePlayerViewControllerAnimated(videoPlayer)
        
        let client = XCDYouTubeClient()
        
        var video = XCDYouTubeVideo()
        
        
        // get video
        client.getVideoWithIdentifier("9bZkp7q19f0", completionHandler:{ (XCDYouTubeVideo, Error) -> Void in
            
            if (Error == nil) {
                video = XCDYouTubeVideo!
                var audioUrl:URL?
                for (key, value) in video.streamURLs {
                    if (String(describing: key) == "140") {
                   
                       audioUrl = value
                       print(audioUrl?.absoluteString)
                        self.play(url: audioUrl!)
                    }
                }
            }
            
        })
        
        
    
    }
    
    func play(url:URL) {
        print("playing \(url)")
        
        do {
            self.player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            player.volume = 1.0
            player.play()
        } catch let error as NSError {

            print(error.localizedDescription)
        } catch {
            print("AVAudioPlayer init failed")
        }
        
    }
    
}
