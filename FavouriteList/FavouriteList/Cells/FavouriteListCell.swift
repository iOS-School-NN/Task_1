//
//  FavouriteListCell.swift
//  FavouriteList
//
//  Created by Alexander on 13.06.2021.
//

import UIKit

class FavouriteListCell: UITableViewCell {
    static let cellId = "FavouritListCellId"
    
    @IBOutlet var itemImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        itemImageView.layer.cornerRadius = itemImageView.bounds.height / 2
    }
    
    func fill(item: FavouriteListItem) {
        itemImageView.image = UIImage(named: item.imageName)
        titleLabel.text = item.title
        priceLabel.text = item.roundedPriceString
        priceLabel.isHidden = item.roundedPriceString == nil
    }
}
