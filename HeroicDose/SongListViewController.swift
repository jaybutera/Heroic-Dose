//
//  SongListViewController.swift
//  HeroicDose
//


import UIKit


class SongListViewController: UIViewController,UITableViewDataSource, UITableViewDelegate  {
    
    
    @IBOutlet var tableView: UITableView!
    
    public var posts = [Song]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // No need for semicolon
        
        setupTable()
        setupCells()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Song List"
        print(posts.count)
               
    }
    
    func setupMenu () {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(SSASideMenu.presentLeftMenuViewController))

    }
    func setupTable() {
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: SongTableViewCell.kCellIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: SongTableViewCell.kCellIdentifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        setupCells()
    }
    
    fileprivate func setupCells() {
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SongTableViewCell.kCellIdentifier, for: indexPath) as! SongTableViewCell
        cell.albumImage.setImageFromURl(stringImageUrl: (posts[indexPath.row].imageUrl.absoluteString))
        
        cell.songTitle.text = posts[indexPath.row].title + posts[indexPath.row].title
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let vc = PlayerViewController()
        let row = Int(indexPath.row)
        //vc.firstSong =  posts[row]
    
        let postsCount = Int(posts.count)
        
        for index in row+1..<postsCount {
            let title = posts[row].title
            let url = posts[row].streamUrl
            let imgUrl = posts[row].imageUrl
            let type = WebsiteType.SoundCloud
            
            let smallPost = post(title: title, url: url.absoluteString, img_url: imgUrl.absoluteString, type: type)
            vc.songs.append(smallPost)
        }
      
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    
}

