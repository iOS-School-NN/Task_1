//
//  FavouriteTableViewCell.swift
//  Task1
//
//  Created by Mary Matichina on 13.06.2021.
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var iconView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Configure
    
    func configure(_ iconName: UIImage, _ title: String, _ price: Double? = nil) {
        
        if let price = price {
            priceLabel.text = String(format: "%.2f$", price)
            priceLabel.isHidden = false
        } else {
            priceLabel.text = ""
            priceLabel.isHidden = true
        }
        
        priceLabel.textColor = .systemGray
        priceLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
    
        iconView.image = iconName
        iconView.contentMode = .scaleAspectFill
        iconView.layer.cornerRadius = (iconView?.frame.size.width ?? 0.0) / 2
        iconView.clipsToBounds = true
        
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        
        
    }
}
