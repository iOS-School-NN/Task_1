//
//  MovieTableViewCell.swift
//  SplitVC
//
//  Created by Grifus on 10.06.2021.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var priceLable: UILabel!
    
    @IBOutlet weak var cellImage: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //layoutIfNeeded()
        cellImage.layer.cornerRadius = cellImage.bounds.height / 2
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
