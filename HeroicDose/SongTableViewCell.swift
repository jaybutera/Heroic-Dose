//
//  SongTableViewCell.swift
//  HeroicDose
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
     static let kCellIdentifier = "SongTableViewCell"

   
    @IBOutlet var songTitle: UILabel!
    
    @IBOutlet var albumImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
