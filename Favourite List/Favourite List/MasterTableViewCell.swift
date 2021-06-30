//
//  MasterTableViewCell.swift
//  Favourite List
//
//  Created by Step ToVictory on 29.06.2021.
//

import UIKit

class MasterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        itemTitle.font = UIFont.boldSystemFont(ofSize: 20)
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
            super.layoutSubviews()
            itemImage.layer.cornerRadius = itemImage.frame.width / 6
        }
}


