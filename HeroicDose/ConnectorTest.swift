//
//  ViewController.swift
//  redditConnector
//
//  Created by Casper on 2/25/17.
//  Copyright © 2017 Jay Butera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let rc = PostFactory()
        
        rc.resetAndGetPosts(prim_categ: Category.Upbeat, sec_categ: nil, num_posts: 7, closure: { posts in
            print(posts.count)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

