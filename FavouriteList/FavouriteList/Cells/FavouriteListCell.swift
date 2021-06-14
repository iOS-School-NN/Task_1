//
//  FavouriteListCell.swift
//  FavouriteList
//
//  Created by Alexander on 13.06.2021.
//

import UIKit

class FavouriteListCell: UITableViewCell {
    static let cellId = "FavouritListCellId"
    
    @IBOutlet var cellImageView: UIImageView!
    @IBOutlet var cellTitleLabel: UILabel!
    @IBOutlet var cellPriceLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cellImageView.layer.cornerRadius = cellImageView.bounds.height / 2
    }
    
    func fill(item: FavouriteListItem) {
        cellImageView.image = item.image
        cellTitleLabel.text = item.title
        cellPriceLabel.text = item.roundedPriceString
        cellPriceLabel.isHidden = item.roundedPriceString == nil
    }
}
