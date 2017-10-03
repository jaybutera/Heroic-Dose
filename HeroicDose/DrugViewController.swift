//
//  DrugViewController.swift
//  HeroicDose
//


import UIKit


class DrugViewController: UIViewController {
    
    
    @IBOutlet var drugButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor = UIColor.white
        
        
        //title = "Drug"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(SSASideMenu.presentLeftMenuViewController))
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool)  {
        super.viewWillAppear(animated)
        
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
        horizontalMotionEffect.minimumRelativeValue = -10
        horizontalMotionEffect.maximumRelativeValue = 10
        
        // Create group to combine both
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontalMotionEffect, verticalMotionEffect]
        
        // Add both effects to your view
        backgroundImage.addMotionEffect(group)
        
        self.view.insertSubview(backgroundImage, at: 0)
        
        setupUI()
    }
    
    func setupUI() {
        
        
        
        for button in drugButtons {
            
            
            button.addTarget(self, action: #selector(chooseCategory), for: .touchUpInside )
            print(button.tag)
        }
        
    }
    
    func chooseCategory(sender: UIButton) {
        
        switch sender.tag {
            
        case 0:
            let vc = DrugSecondViewController()
            vc.type = .LSD
           self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case 1:
            let vc = DrugSecondViewController()
            vc.type = .Weed
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
        case 2:
            let vc = DrugSecondViewController()
            vc.type = .Shrooms
            self.navigationController?.pushViewController(vc, animated: true)
            
            break
        case 3:
            let vc = DrugSecondViewController()
            vc.type = .Esctasy
            self.navigationController?.pushViewController(vc, animated: true)
            break
            
            
        default:
            break
        }
        
        
    }
    
    
    
    
    
}
