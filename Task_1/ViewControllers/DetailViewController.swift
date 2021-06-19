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
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    private let viewModel = DetailViewModel()
    
    func configure(item: ItemModel) {
        viewModel.configure(item)
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
        detailDescriptionLabel.text = viewModel.description
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
