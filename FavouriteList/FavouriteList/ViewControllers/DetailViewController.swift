//
//  DetailViewController.swift
//  FavouriteList
//
//  Created by Alexander on 12.06.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var detailImageView: UIImageView!
    @IBOutlet var detailTitleLabel: UILabel!
    @IBOutlet var detailPriceLabel: UILabel!
    @IBOutlet var detailRatingLabel: UILabel!
    @IBOutlet var detailDescriptionLabel: UILabel!
    
    var item: FavouriteListItem? {
        didSet { setupUI() }
    }
    
    private func setupUI() {
        loadViewIfNeeded()
        detailImageView.image = item?.image
        detailTitleLabel.text = item?.title
        detailPriceLabel.text = item?.roundedPriceString
        detailRatingLabel.text = item?.starsRatingString
        detailDescriptionLabel.text = item?.description
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        detailImageView.layer.cornerRadius = detailImageView.bounds.height / 2
    }
}

extension DetailViewController: CellSelectableDelegate {
    func didSelect(item: FavouriteListItem) {
        self.item = item
    }
}
