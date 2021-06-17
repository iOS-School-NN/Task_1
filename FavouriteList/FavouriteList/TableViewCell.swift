//
//  TableViewCell.swift
//  FavouriteList
//
//  Created by Daria Tokareva on 16.06.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var nameCell: UILabel!
    @IBOutlet weak var priceCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        DispatchQueue.main.async { [weak self] in
            self!.imageCell.layer.cornerRadius = self!.imageCell.layer.bounds.height / 2
            self!.imageCell.clipsToBounds = true
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func set(item: Item) {
        imageCell.image = UIImage(named: item.imageName)
        nameCell.text = item.title
        if item.price == nil {
            priceCell.isHidden = true
        } else {
            priceCell.isHidden = false
            priceCell.text = String(item.price!) + "₽"
        }
    }
}
