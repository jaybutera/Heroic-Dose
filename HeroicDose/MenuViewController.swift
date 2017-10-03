//
//  MenuViewController.swift
//  firethorn
//


import UIKit
import SwiftyUserDefaults

class MenuViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.frame = CGRect(x: 20, y: (self.view.frame.size.height - 54 * 5) / 2.0, width: self.view.frame.size.width, height: 54 * 5)
        tableView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth]
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isOpaque = false
        tableView.backgroundColor = UIColor.clear
        tableView.backgroundView = nil
        tableView.bounces = false
        return tableView
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.clear
        view.addSubview(tableView)
        self.sideMenuViewController?.statusBarStyle = .hidden
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


// MARK : TableViewDataSource & Delegate Methods
extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let titles: [String] = ["Drug", "Category", "User Playlists", "Saved"]
        
        let images: [String] = ["IconHome", "IconCalendar", "IconProfile", "IconSettings"]
        
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.font = UIFont(name: "Optima-Bold", size: 28)
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.text  = titles[indexPath.row]
        cell.selectionStyle = .none
        cell.imageView?.image = UIImage(named: images[indexPath.row])
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        
        case 0:
            
          sideMenuViewController?.contentViewController = BaseNavigationViewController(rootViewController: DrugViewController())
          sideMenuViewController?.contentViewController?.navigationController?.navigationBar.isTranslucent = true
        
            sideMenuViewController?.hideMenuViewController()
            break
        case 1:
            
            
            sideMenuViewController?.contentViewController =  BaseNavigationViewController(rootViewController: CategoryViewController())
            sideMenuViewController?.hideMenuViewController()
            break
        case 2:
            
            sideMenuViewController?.contentViewController =  BaseNavigationViewController(rootViewController: UserPlaylistsViewController())
            sideMenuViewController?.hideMenuViewController()
           
            break
            
        case 3:
            let vc = SongListViewController()
            vc.setupMenu()
            vc.posts = Defaults[.songs]!
               
            sideMenuViewController?.contentViewController =  BaseNavigationViewController(rootViewController: vc)
            sideMenuViewController?.hideMenuViewController()
            break
        default:
            break
        }
        
        
    }
    
}
    
