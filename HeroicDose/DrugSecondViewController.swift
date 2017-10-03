//
//  DrugSecondViewController.swift
//  HeroicDose
//


import UIKit

class DrugSecondViewController: UIViewController {
    
    @IBOutlet var secondCategories: [UIButton]!
    
    var type: Drug?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // No need for semicolon
        
        
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "stars_bg.png")
        backgroundImage.contentMode =  UIViewContentMode.scaleAspectFill
        backgroundImage.alpha = 0.95
        
        
        
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
        
        setupUI()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "Drug Category"
        
    }
    
    func setupUI () {
        
        let rc = CategoryRecommender()
        
        let categories = rc.related(d: type!)
        
        var i = 0
        
        for button in secondCategories {
            
            if i > categories.count - 1  {
                
                button.isHidden = true
                continue
            }
            button.setTitle(categories[i].rawValue, for: .normal)
            button.addTarget(self, action: #selector(chooseCategory), for: .touchUpInside )
            print(button.tag)
            i = i + 1
        }
        

        
    }
    
    func chooseCategory(sender: UIButton) {
        
        let rc = CategoryRecommender()
        
        let categories = rc.related(d: type!)

        
        switch sender.tag {
            
        case 0:
            
            let rc = PostFactory()
            
            rc.resetAndGetPosts(prim_categ: Category(rawValue: categories[sender.tag].rawValue)!, sec_categ: nil, num_posts: 6, closure: { (posts) in
                if (posts.count < 1) {
                    let alert = UIAlertController(title: "Alert", message: "No Songs Available", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                for post in posts {
                    
                    print(post.url)
                }
                let vc = PlayerViewController()
                vc.firstSong = posts[0]
                
                let postsCount = Int(posts.count)
                if postsCount > 1{
                    for index in 1..<postsCount {
                        
                        vc.songs.append(posts[index])
                    }
                }
                self.navigationController?.pushViewController(vc, animated: true)
            })
            break
            
        case 1:
            let rc = PostFactory()
            
            rc.resetAndGetPosts(prim_categ: Category(rawValue: categories[sender.tag].rawValue)!, sec_categ: nil, num_posts: 6, closure: { (posts) in
                
                if (posts.count < 1) {
                    let alert = UIAlertController(title: "Alert", message: "No Songs Available", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                for post in posts {
                    
                    print(post.url)
                }
                let vc = PlayerViewController()
                vc.firstSong = posts[0]
                
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
            
            rc.resetAndGetPosts(prim_categ: Category(rawValue: categories[sender.tag].rawValue)!, sec_categ: nil, num_posts: 6, closure: { (posts) in
                
                if (posts.count < 1) {
                    let alert = UIAlertController(title: "Alert", message: "No Songs Available", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                for post in posts {
                    
                    print(post.url)
                }
                let vc = PlayerViewController()
                vc.firstSong = posts[0]
                
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
            
            rc.resetAndGetPosts(prim_categ: Category(rawValue: categories[sender.tag].rawValue)!, sec_categ: nil, num_posts: 6, closure: { (posts) in
                
                if (posts.count < 1) {
                    let alert = UIAlertController(title: "Alert", message: "No Songs Available", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                for post in posts {
                    
                    print(post.url)
                }
                let vc = PlayerViewController()
                vc.firstSong = posts[0]
                
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
