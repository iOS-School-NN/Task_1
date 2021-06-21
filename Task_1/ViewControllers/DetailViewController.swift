//
//  DetailViewController.swift
//  Task_1
//
//  Created by KirRealDev on 12.06.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailRatingLabel: UILabel!
    @IBOutlet weak var detailPriceLabel: UILabel!
    @IBOutlet weak var detailDescriptionTextView: UITextView!
    
    private let viewModel = DetailViewModel()
    
    func configure(item: ItemModel) {
        viewModel.configure(item)
    }
    
    private func settingTextView() {
        detailDescriptionTextView.layer.borderWidth = 0.5
        detailDescriptionTextView.layer.borderColor = UIColor.systemGray4.cgColor
        detailDescriptionTextView.layer.cornerRadius = 5.0
        detailDescriptionTextView.isSelectable = false
    }
    
    private func settingTheInformation() {
        detailImageView.image = UIImage(named: viewModel.imageName)
        detailTitleLabel.text = viewModel.title
        detailRatingLabel.text = String(viewModel.myRating)
        if (viewModel.price != "Price: is empty") {
            detailPriceLabel.text = viewModel.price
        }
        else {
            detailPriceLabel.isHidden = true
        }
        detailDescriptionTextView.text = viewModel.description
        settingTextView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingTheInformation()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        detailImageView.layer.cornerRadius = detailImageView.frame.width / 10
        detailImageView.clipsToBounds = true
    }

}
