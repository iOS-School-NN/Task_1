//
//  DetailViewController.swift
//  Task1
//
//  Created by Mary Matichina on 13.06.2021.
//

import UIKit
import DeviceKit

final class DetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var photoView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var descriptionText: UITextView!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var hightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var widthConstraint: NSLayoutConstraint!
    
    // MARK: Properties
    
    var detailItem: Item?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
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
        super.viewDidLayoutSubviews()
        photoView.contentMode = .scaleAspectFill
        photoView.layer.cornerRadius = photoView.frame.size.width / 2
        photoView.clipsToBounds = true
    }
    
    private func configureNavBar() {
        navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK: - Configure
    
    private func configureView() {
        photoView.image = detailItem?.photoName
        
        titleLabel.text = detailItem?.title
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        
        descriptionText.text = detailItem?.description
        descriptionText.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
        priceLabel.textColor = .systemGray
        priceLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        
        ratingLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
    }
    
    private func configure() {
        
        if let price = detailItem?.price {
            priceLabel.text = String(format: "%.2f$", price)
        } else {
            heightConstraint.constant = 0
        }
        
        priceLabel.isHidden = detailItem?.price == nil
        
        if let rating = detailItem?.rating {
            var ratingString = L10n.rating + " "
            for _ in 0..<min(Int(rating), 5) {
                ratingString += "★"
            }
            ratingLabel.text = ratingString
            ratingLabel.isHidden = rating < 1
        }
    }
}
