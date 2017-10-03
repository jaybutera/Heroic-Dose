//
//  redditConnector.swift
//  redditConnector
//
//  Created by Casper on 2/25/17.
//  Copyright © 2017 Jay Butera. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class post {
    let title:      String
    var artist:     String
    let song:       String
    let url:        String
    let img_url:    String
    let type:       WebsiteType?
    let category:   Category
    
    init(title: String, url: String, img_url: String, type: WebsiteType) {
        self.title = title
        self.url = url
        self.img_url = img_url
        self.type = type
        
        let title_split = title.components(separatedBy: ":")
        
        // Must be structured artist:title:category
        if (title_split.count != 3) {
            print("[WARNING] Something wrong with post title:")
            print(self.title)
            
            self.artist     = ""
            self.song       = ""
            self.category   = Category.None
        }
        else {
            // Parse title for info (trim whitespace and make lowercase)
            self.artist     = title_split[0].trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).lowercased()
            self.song       = title_split[1].trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).lowercased()
            
            // If category does not exist, assign None
            if let c = Category(
                rawValue: title_split[2].trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).lowercased()
                ) {
                self.category = c
            }
            else {
                self.category = Category.None
                print("[" + title_split[2] + "] is not a valid category")
            }
        }
        
    } // End init
}

class PostFactory {
    let subreddit_url = "https://www.reddit.com/r/heroicdose/.json"
    
    // Points to next page of posts (used for pagination)
    var after: String?
    
    init () {
        // Initialize to empty for first call
        after = ""
    }
    
    /*
     * Builds a list of post structs.
     * When complete, passes post list to callback
     * *Note secondary category is optional
     */
    func resetAndGetPosts (categ: Category,
                           num_posts: Int,
                           closure: @escaping ([post]) -> Void) {
        
        // Reset <after> page pointer to nil
        after = ""
        
        pageToPosts(categ: categ, num_posts: num_posts, closure: closure)
    }
    
    func getNextPosts (categ: Category,
                       num_posts: Int,
                       closure: @escaping ([post]) -> Void) {
        
        pageToPosts(categ: categ, num_posts: num_posts, closure: closure)
    }
    
    private func pageToPosts (categ: Category,
                              num_posts: Int,
                              closure: @escaping ([post]) -> Void) {
        
        // Query posts from page <after>
        Alamofire.request(subreddit_url + "?after=" + after!)
            .responseJSON { response in
                if let result = response.result.value {
                    let data = JSON(result)
                    
                    let post_strs = data["data"]["children"]
                    var posts = [post]()
                    
                    // Build post list from json page
                    for (_, json) in post_strs {
                        if  let title = json["data"]["title"].string,
                            let url = json["data"]["url"].string,
                            let img_url = json["data"]["media"]["oembed"]["thumbnail_url"].string,
                            let typeData = json["data"]["media"]["type"].string {
                            
                            var websiteType:WebsiteType = .SoundCloud
                            if typeData.range(of:"youtube") != nil{
                                websiteType = .Youtube
                            }
                            // Post struct
                            let p = post(
                                title: title,
                                url: url,
                                img_url: img_url,
                                type: websiteType
                            )
                            
                            // Filter posts by category
                            if self.postMatch(cat: categ, p: p) {
                                posts.append(p)
                            }
                            
                            // Quit if max quota reached
                            if posts.count == num_posts {
                                closure(posts)
                                
                                return
                            }
                        }
                    }
                    
                    // Update page pointer
                    self.after = data["data"]["after"].string
                    
                    // Base case - no next page
                    if self.after == nil {
                        // Completion handler callback
                        closure(posts)
                        
                        return
                    }
                    
                    // If number of desired posts hasn't been reach, get next page
                    if posts.count < num_posts {
                        self.pageToPosts(categ: categ, num_posts: num_posts, closure: closure)
                    }
                    
                }
        }
    }
    
    /*
     * Determines if a post meets category query conditions
     */
    private func postMatch (cat: Category, p: post) -> Bool {
        return p.category == cat
    }
}
class CategoryRecommender {
    let drugList = [
        Drug.LSDShrooms : [Category.Calm, Category.Comedown, Category.Blastoff, Category.Psychedelic],
        Drug.Weed : [Category.Chill, Category.Groovin, Category.Mindsurf, Category.Bawlin],
        Drug.Esctasy : [Category.Trance, Category.Bass, Category.Freelove]
    ]
    
    func related (d: Drug) -> [Category] {
        return drugList[d]!
    }
}

// CATEGORIES
//-----------------------
/*
 enum Category: String {
 case Trippy = "trippy"
 case Love = "love"
 case ComfortablyNumb = "comfortably numb"
 case Friends = "friends"
 case Energy = "energy"
 case Hype = "hype"
 case YouAndMe = "you and me"
 case Soul = "soul"
 case Instrumental = "instrumental"
 case Heat = "heat"
 case Rock = "rock"
 case Psychedelic = "psychedelic"
 case Electric = "electric"
 case Bass = "bass"
 case Upbeat = "upbeat"
 case Comedown = "comedown"
 case Serenity = "serenity"
 case FolkRock = "folk rock"
 case HipHop = "hip hop"
 }
 */

enum Category: String {
    case Chill = "chill"
    case Groovin = "groovin"
    case Mindsurf = "mindsurf"
    case Calm = "calm"
    case Comedown = "comedown"
    case Blastoff = "blastoff"
    case Psychedelic = "psychedelic"
    case Trance = "trance"
    case Bass = "bass"
    case Freelove = "freelove"
    case Bawlin = "bawlin"
    case None = "none" // Error occured
}


enum Drug {
    case LSDShrooms
    case Weed
    case Esctasy
}

@objc enum WebsiteType:Int {
    case Youtube
    case SoundCloud
    
}
