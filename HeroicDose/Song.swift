//
//  Song.swift
//  HeroicDose
//

import Foundation
import Soundcloud

class Song: NSObject, NSCoding {
    
    
    
    var title:String = " "
    
    var trackId:Int = 0
    
    var streamUrl:URL = URL(string: "https://i1.sndcdn.com/artworks-000036740245-ohuco7-large.jpg?client_id=7467688f360c6055fb679c3bd739acbc")!
    
    var imageUrl:URL = URL(string: "https://i1.sndcdn.com/artworks-000036740245-ohuco7-large.jpg?client_id=7467688f360c6055fb679c3bd739acbc")!
    
    
  
    
    init( title:String, streamUrl:URL, trackId:Int, imageUrl:URL) {
        
        self.title = title
        self.trackId = trackId
        self.streamUrl = streamUrl
        self.imageUrl = imageUrl
        
    }
    
    required  convenience init(coder aDecoder: NSCoder) {
        let title = aDecoder.decodeObject(forKey: "title") as! String
        let trackId = aDecoder.decodeInteger(forKey: "trackId")
        let streamUrl = aDecoder.decodeObject(forKey: "streamUrl") as! URL
        let imageUrl = aDecoder.decodeObject(forKey: "imageUrl") as! URL
   
        
        self.init(title: title, streamUrl: streamUrl, trackId: trackId, imageUrl: imageUrl)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(trackId, forKey: "trackId")
        aCoder.encode(streamUrl, forKey: "streamUrl")
        aCoder.encode(imageUrl, forKey: "imageUrl")
      
        
    }

    
}
