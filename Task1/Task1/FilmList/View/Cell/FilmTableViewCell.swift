//
//  FilmTableViewCell.swift
//  Task1
//
//  Created by Mary Matichina on 13.06.2021.
//

import UIKit

final class FilmTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var photoView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    // MARK: - Configure
    
   private func configure() {
        priceLabel.textColor = .systemGray
        priceLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        
        photoView.contentMode = .scaleAspectFill
        photoView.layer.cornerRadius = photoView.frame.size.width / 2
        photoView.clipsToBounds = true
        
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
    }
    
    func configureCell(_ iconName: UIImage, _ title: String, _ price: Double? = nil) {
        
        if let price = price {
            priceLabel.text = String(format: "%.2f$", price)
        }
        priceLabel.isHidden = price == nil
        photoView.image = iconName
        titleLabel.text = title
    }
}
