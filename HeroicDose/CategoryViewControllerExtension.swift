//
//  CategoryViewControllerExtension.swift
//  HeroicDose
//


import UIKit



extension CategoryViewController {
    
    /*
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 80
        } else {
            return 40
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.kCellIdentifier, for: indexPath) as! DescriptionTableViewCell
            cell.previewImage.image = image
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.selectionStyle = .none
            cell.accessoryType = .disclosureIndicator
            cell.textLabel!.text = "Select a place"
            return cell
        } else if indexPath.section == 2 && me.causes > 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.selectionStyle = .none
            cell.accessoryType = .disclosureIndicator
            cell.textLabel!.text = "Select a Community Cause"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let vc = SelectPlaceViewController()
            vc.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.section == 2 {
            let vc = SelectCauseViewController()
            vc.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    */
    
    
    
}
