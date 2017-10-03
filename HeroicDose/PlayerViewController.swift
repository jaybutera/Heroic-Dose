//
//  PlayerViewController.swift
//  HeroicDose
//

import UIKit
import Soundcloud
import AVFoundation
import MediaPlayer
import SwiftyUserDefaults
import XCDYouTubeKit

class PlayerViewController: UIViewController {
    
    
    @IBOutlet var albumImage: UIImageView!
    
    @IBOutlet var songTitleLabel: UILabel!
    
    @IBOutlet var playButton: UIButton!
    @IBOutlet var heartButton: UIButton!
    
    var favouriteSongs = Defaults[.songs]
    
    var firstSong: post?
    
    var songs: [post] = []
    
    var player:AVQueuePlayer?
    
    var songsToPlay =  [song]()
    
    typealias song = (String, URL, URL, Int)
    
    
    var favouritedSongs = DefaultsKey<[String: Any]>("favouritedSongs")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Get all songs to be played
        player?.actionAtItemEnd = AVPlayerActionAtItemEnd.advance
        
        
        // Set  notification for finished playing
        NotificationCenter.default.addObserver(self, selector: #selector(self.playerDidFinishPlaying(note: )), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player?.currentItem)
        
        playButton.setImage(UIImage(named: "Play-50"), for:.selected)
        playButton.setImage(UIImage(named: "Pause-50"), for: .normal)
        
        heartButton.setImage(UIImage(named: "Hearts-50"), for: .normal)
        heartButton.setImage(UIImage(named: "Hearts Filled-50"), for: .selected)
        
        
        
        
        for song in songs {
            
            
           
            if song.type == WebsiteType.SoundCloud {
                
             
                Soundcloud.resolve(URI: song.url) { (response) in
                    
                    if (response.response.error != nil) {
                        
                        
                        print("error")
                        return
                    }
                    
                    
                    
                    
                    let title = response.response.result?.tracks?[0].title
                    let imageUrl = response.response.result?.tracks?[0].artworkImageURL.highURL
                    let streamUrl = response.response.result?.tracks?[0].streamURL
                    let trackId = response.response.result?.tracks?[0].identifier
                    
                    var song = (title!, imageUrl!, streamUrl!, trackId!)
                    let playerItem = AVPlayerItem(url: streamUrl!)
                    self.player?.insert(playerItem, after: nil)
                    self.songsToPlay.append(song)
                    
                }
            }
            else if song.type == WebsiteType.Youtube {
                if let videoID = song.url.components(separatedBy: "=").last {
                    
                    
                    
                    
                    let client = XCDYouTubeClient()
                    
                    var video = XCDYouTubeVideo()
                    
                    
                    // get video
                    client.getVideoWithIdentifier(videoID, completionHandler:{ (XCDYouTubeVideo, Error) -> Void in
                        
                        if (Error == nil) {
                            video = XCDYouTubeVideo!
                            var audioUrl:URL?
                            for (key, value) in video.streamURLs {
                                if (String(describing: key) == "140") {
                                    
                                    audioUrl = value
                                    let title = video.title
                                    let imageUrl = video.mediumThumbnailURL! as URL
                                    let streamUrl = audioUrl
                                    let trackId = 0
                                    
                                    var song = (title, imageUrl, streamUrl!, trackId)
                                    let playerItem = AVPlayerItem(url: streamUrl!)
                                    self.player?.insert(playerItem, after: nil)
                                    self.songsToPlay.append(song)
                                }
                            }
                        }
                        
                    })
                    
                    
                    
                    
                }
                
            
            }
            
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // No need for semicolon
        
        player? = AVQueuePlayer()
        
        songTitleLabel.text = " "
        
        // Add support for background audio
        UIApplication.shared.beginReceivingRemoteControlEvents()
        let commandCenter = MPRemoteCommandCenter.shared()
        
        commandCenter.nextTrackCommand.addTarget(self, action: #selector(nextSong))
        commandCenter.nextTrackCommand.isEnabled = true
        commandCenter.skipBackwardCommand.isEnabled = false
        commandCenter.playCommand.isEnabled = true
        commandCenter.playCommand.addTarget(self, action: #selector(playPause))
        
        commandCenter.pauseCommand.isEnabled = true
        commandCenter.pauseCommand.addTarget(self, action: #selector(playPause))
        commandCenter.nextTrackCommand.addTarget(self, action:#selector(nextSong))
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            do {
                try AVAudioSession.sharedInstance().setActive(true)
            } catch let error as Error{
                print(error.localizedDescription)
            }
        } catch let error as Error {
            print(error.localizedDescription)
        }
        
       
        
      if firstSong?.type == WebsiteType.SoundCloud {
        Soundcloud.resolve(URI: (firstSong?.url)!) { (response) in
            
            if (response.response.error != nil) {
                
                
                self.nextSong()
                return
            }
            
            
            let title = response.response.result?.tracks?[0].title
            let imageUrl = response.response.result?.tracks?[0].artworkImageURL.highURL
            let streamUrl = response.response.result?.tracks?[0].streamURL
            let trackId = response.response.result?.tracks?[0].identifier
            
            
            self.setupSong(title: title!, streamURL: streamUrl!, albumImage: imageUrl!, trackId: trackId!)
        }
        }
        else if firstSong?.type == WebsiteType.Youtube {
            
            if let videoID = firstSong?.url.components(separatedBy: "=").last {
                
                
                
                
                let client = XCDYouTubeClient()
                
                var video = XCDYouTubeVideo()
                
                
                // get video
                client.getVideoWithIdentifier(videoID, completionHandler:{ (XCDYouTubeVideo, Error) -> Void in
                    
                    if (Error == nil) {
                        video = XCDYouTubeVideo!
                        var audioUrl:URL?
                        for (key, value) in video.streamURLs {
                            if (String(describing: key) == "140") {
                                
                                audioUrl = value
                                let title = video.title
                                print(video.debugDescription)
                                let imageUrl = video.smallThumbnailURL! as URL
                                let streamUrl = audioUrl
                                let trackId = 0
                                
                                print(audioUrl?.absoluteString)
                                
                                
                                
                                self.setupSong(title: title, streamURL: streamUrl!, albumImage: imageUrl, trackId: trackId)
                               
                            }
                        }
                    }
                    
                })
                
                
            }

            
        }
        
    }
    
    
    
    
    
    func saveSettings () {
        
        Defaults[.songs] = favouriteSongs
        Defaults.synchronize()
        
    }
    
    
    func setupSong (title: String, streamURL: URL, albumImage: URL, trackId:Int) {
        
        self.songTitleLabel.text = title
        
        self.albumImage.setImageFromURl(stringImageUrl: (albumImage.absoluteString))
        
        
        if (self.containsSong(titleId: trackId)) {
            self.heartButton.isSelected = true
        } else {
            
            self.heartButton.isSelected = false
        }
        
        print(streamURL)
        
        do {
            let playerItem = AVPlayerItem(url: streamURL)
            self.player = AVQueuePlayer(playerItem: playerItem)
            player!.volume = 1.0
            player!.play()
            
            
        } catch let error as NSError {
            self.player = nil
            print(error.localizedDescription)
        } catch {
            print("AVAudioPlayer init failed")
        }
        
        
    }
    
    
    
    
    @IBAction func heartButton(_ sender: UIButton) {
        
        
        heartButton.isSelected = !heartButton.isSelected
        
        let title = songsToPlay.first?.0
        let stream = songsToPlay.first?.2
        let imageUrl = songsToPlay.first?.1
        let trackId = songsToPlay.first?.3
        
        
        
        let song = Song(title: title!, streamUrl: stream!, trackId: trackId!, imageUrl: imageUrl!)
        
        
       
        if ( favouriteSongs?.contains(song))!{
            
            print("already saved")
        }
        else {
            
            favouriteSongs?.append(song)
            saveSettings()
            
        }
        
   
    }
    
    
    
    @IBAction func playButton(_ sender: UIButton) {
        
        playPause()
    }
    
    @objc func playPause () {
        
        
        playButton.isSelected = !playButton.isSelected
        
        if (player?.rate != 0 && player?.error == nil){
            
            player?.pause()
            
        } else {
            
            player?.play()
            
        }
        
    }
    
    @IBAction func forwardButton(_ sender: UIButton) {
        
        nextSong()
    }
    
    @objc func nextSong () {
        
        player?.advanceToNextItem()
       
        if (songsToPlay.first != nil) {
            let title = songsToPlay.first?.0
            let stream = songsToPlay.first?.2
            let imageUrl = songsToPlay.first?.1
            let trackId = songsToPlay.first?.3
            
            let song = Song(title: title!, streamUrl: stream!, trackId: trackId!, imageUrl: imageUrl!)
            
            
            var artwork:UIImage?
            if let url = URL(string: (imageUrl?.absoluteString)!) {
                
                if let data1 = NSData(contentsOf: url){
                    artwork = UIImage(data: data1 as Data)
                }
            }
            
            
            
            MPNowPlayingInfoCenter.default().nowPlayingInfo = [MPMediaItemPropertyTitle: title, MPMediaItemPropertyArtist: " ", MPMediaItemPropertyArtwork:MPMediaItemArtwork(image: artwork!)
                , MPNowPlayingInfoPropertyPlaybackRate: 1.0]
            
            
            
            setupSong(title: title!, streamURL: stream!, albumImage: (songsToPlay.first?.1)!,trackId: trackId!)
            
        }

        if (songsToPlay.first != nil) {
            songsToPlay.removeFirst()
        } else {
            print("no more songs")
        }
    }
    
    func containsSong(titleId: Int)-> Bool {
        
        
        for song in favouriteSongs! {
            
            if (song.trackId == titleId) {
                
                
                return true
            }
            
        }
        
        return false
        
    }
    
    
    func playerDidFinishPlaying(note: NSNotification) {
        
        
        if (songsToPlay.first != nil) {
            let title = songsToPlay.first?.0
            let stream = songsToPlay.first?.2
            let imageUrl = songsToPlay.first?.1
            let trackId = songsToPlay.first?.3
            
            let song = Song(title: title!, streamUrl: stream!, trackId: trackId!, imageUrl: imageUrl!)
            
            
            setupSong(title: title!, streamURL: stream!, albumImage:(songsToPlay.first?.1)!, trackId: trackId!)
            songsToPlay.removeFirst()
        }
        
        
    }
    
}
