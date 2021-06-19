//
//  ItemMasterTableViewCell.swift
//  Task_1
//
//  Created by KirRealDev on 15.06.2021.
//

import UIKit

class ItemMasterTableViewCell: UITableViewCell {

    @IBOutlet private weak var itemImageView: UIImageView!
    
    @IBOutlet private weak var itemTitleLabel: UILabel!
    @IBOutlet private weak var itemPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(_ item: ItemModel) {
        itemImageView.image = UIImage(named: item.imageName)
        itemTitleLabel.text = item.title
        //!!!
        if (item.formattedPrice == nil) {
            itemPriceLabel.isHidden = true
        }
        itemPriceLabel.text = item.formattedPrice
        itemImageView.layer.cornerRadius = itemImageView.frame.width / 6
    }
    
}
