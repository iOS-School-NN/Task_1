//
//  DetailViewController.swift
//  Task1
//
//  Created by Mary Matichina on 13.06.2021.
//

import UIKit
import DeviceKit

class DetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var iconView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var descrText: UITextView!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var hightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var widthConstraint: NSLayoutConstraint!
    
    // MARK: Properties
    
    var detailItem: Items?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
        if Device.current.diagonal == 4.0 {
            hightConstraint.constant = 80
            widthConstraint.constant = 80
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavBar()
    }
    
    override func viewDidLayoutSubviews() {
        iconView.contentMode = .scaleAspectFill
        iconView.layer.cornerRadius = (iconView?.frame.size.width ?? 0.0) / 2
        iconView.clipsToBounds = true
    }
    
    private func configureNavBar() {
        navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK: - Configure
    
    private func configure() {
        iconView.image = detailItem?.iconName
        
        titleLabel.text = detailItem?.title
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        
        descrText.text = detailItem?.descr
        descrText.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
        priceLabel.textColor = .systemGray
        priceLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
       
        if let price = detailItem?.price {
            priceLabel.text = String(format: "%.2f$", price)
            priceLabel.isHidden = false
        } else {
            priceLabel.text = ""
            priceLabel.isHidden = true
            heightConstraint.constant = 0
        }
        
        if let rating = detailItem?.rating {
            var ratingString = L10n.rating + " "
            for _ in 0..<min(Int(rating), 5) {
                ratingString += "★"
            }
            ratingLabel.text = ratingString
            ratingLabel.isHidden = rating < 1
            ratingLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        }
    }
}
