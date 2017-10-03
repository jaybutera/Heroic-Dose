//
//  CategoryViewController.swift
//  HeroicDose
//

import UIKit
import Soundcloud

class CategoryViewController: UIViewController {
    
    
    
    @IBOutlet var categoryButtons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor = UIColor.white
        
        //title = "Categories"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(SSASideMenu.presentLeftMenuViewController))
        //self.navigationController?.navigationBar.isTranslucent = true
        //navigationBar.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        //navigationBar.shadowImage = UIImage()
        //navigationBar.setBackgroundImage(UIImage(), for: .default)
        
    }
    
    override func viewWillAppear(_ animated: Bool)  {
        super.viewWillAppear(animated)
        
        setupUI()
    }
    
    func setupUI (){
        
        
        for button in categoryButtons {
            
            
            button.addTarget(self, action: #selector(chooseCategory), for: .touchUpInside )
            button.setTitleColor(UIColor.white, for: .normal)
            //button.setTitle("Category ", for: .normal)
            button.layer.cornerRadius = 0.5 * button.bounds.size.height
            button.clipsToBounds = true
            //button.layer.borderWidth = 3.0
            
            button.layer.borderColor = UIColor.white.cgColor
            button.adjustsImageWhenHighlighted = false
        }
        
        
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "stars_bg.png")
        backgroundImage.contentMode =  UIViewContentMode.scaleAspectFill
        backgroundImage.alpha = 0.6
        
        
        
        // Set vertical effect
        let verticalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y",
                                                               type: .tiltAlongVerticalAxis)
        verticalMotionEffect.minimumRelativeValue = -15
        verticalMotionEffect.maximumRelativeValue = 15
        
        // Set horizontal effect
        let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x",
                                                                 type: .tiltAlongHorizontalAxis)
        horizontalMotionEffect.minimumRelativeValue = -15
        horizontalMotionEffect.maximumRelativeValue = 15
        
        // Create group to combine both
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontalMotionEffect, verticalMotionEffect]
        
        // Add both effects to your view
        backgroundImage.addMotionEffect(group)
        
        self.view.insertSubview(backgroundImage, at: 0)
        
    }
    
    
    func chooseCategory(sender: UIButton) {
        switch sender.tag {
            
        case 0:
            
            let rc = PostFactory()
            
            rc.resetAndGetPosts(prim_categ: .Upbeat, sec_categ: nil, num_posts: 6, closure: { (posts) in
                
                if (posts.count < 1) {
                    let alert = UIAlertController(title: "Alert", message: "No Songs Available", preferredStyle: UIAlertControllerStyle.alert)
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                let vc = PlayerViewController()
                vc.firstSong =  posts[0]
                
                if posts.count > 1 {
                    
                    let postsCount = Int(posts.count)
                    for index in 1..<postsCount {
                        
                        vc.songs.append(posts[index])
                    }
                }
                self.navigationController?.pushViewController(vc, animated: true)
            })
            break
            
        case 1:
            let rc = PostFactory()
            
            rc.resetAndGetPosts(prim_categ: .Love, sec_categ: nil, num_posts: 6, closure: { (posts) in
                
                if (posts.count < 1) {
                    let alert = UIAlertController(title: "Alert", message: "No Songs Available", preferredStyle: UIAlertControllerStyle.alert)
                     alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                let vc = PlayerViewController()
                 vc.firstSong =  posts[0]
                
                let postsCount = Int(posts.count)
                if postsCount > 1{
                    for index in 1..<postsCount {
                        
                        vc.songs.append(posts[index])
                    }
                }
                self.navigationController?.pushViewController(vc, animated: true)
            })
            
            break
            
        case 2:
            let rc = PostFactory()
            
            rc.resetAndGetPosts(prim_categ: .Trippy, sec_categ: nil, num_posts: 6, closure: { (posts) in
                
                if (posts.count < 1) {
                    let alert = UIAlertController(title: "Alert", message: "No Songs Available", preferredStyle: UIAlertControllerStyle.alert)
                     alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                let vc = PlayerViewController()
                vc.firstSong =  posts[0]
                
                let postsCount = Int(posts.count)
                if postsCount > 1{
                    for index in 1..<postsCount {
                        
                        vc.songs.append(posts[index])
                    }
                }
                self.navigationController?.pushViewController(vc, animated: true)
            })
            
            break
        case 3:
            let rc = PostFactory()
            
            rc.resetAndGetPosts(prim_categ: .ComfortablyNumb, sec_categ: nil, num_posts: 6, closure: { (posts) in
                if (posts.count < 1) {
                    let alert = UIAlertController(title: "Alert", message: "No Songs Available", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                let vc = PlayerViewController()
                 vc.firstSong =  posts[0]
                
                let postsCount = Int(posts.count)
                if postsCount > 1{
                    for index in 1..<postsCount {
                        
                        vc.songs.append(posts[index])
                    }
                }
                
                self.navigationController?.pushViewController(vc, animated: true)
            })
            
            break
        case 4:
            let rc = PostFactory()
            
            rc.resetAndGetPosts(prim_categ: .Friends, sec_categ: nil, num_posts: 6, closure: { (posts) in
                if (posts.count < 1) {
                    let alert = UIAlertController(title: "Alert", message: "No Songs Available", preferredStyle: UIAlertControllerStyle.alert)
                     alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                let vc = PlayerViewController()
                vc.firstSong =  posts[0]
                let postsCount = Int(posts.count)
                if postsCount > 1{
                    
                    for index in 1..<postsCount {
                        
                        vc.songs.append(posts[index])
                    }
                }
                self.navigationController?.pushViewController(vc, animated: true)
            })
            
            break
            
        default:
            break
        }
        
        
    }
    
    
    
    
}
