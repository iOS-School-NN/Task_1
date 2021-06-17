//
//  DetailViewController.swift
//  FavouriteList
//
//  Created by Daria Tokareva on 16.06.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var itemObject: Item? {
        didSet{
            DispatchQueue.main.async { [weak self] in
                self?.setDescriptionOfItem()
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidLayoutSubviews() {
        imageView.layer.cornerRadius = imageView.bounds.height / 2
        
    }
    
    func setDescriptionOfItem() {
        imageView.image = UIImage(named: itemObject!.imageName)
        nameLabel.text = itemObject?.title
        ratingLabel.text = "Rating: \(starRating())"
        if itemObject!.price == nil {
            priceLabel.isHidden = true
        } else {
            priceLabel.isHidden = false
            priceLabel.text = String(format: "%.2f₽", itemObject!.price!)
        }
        descriptionLabel.text = itemObject?.description
        
    }
    
    private func starRating() -> String {
        let starsCount = Int((itemObject?.myRating)!)
        var resultString = ""
        for i in 1...5 {
            resultString += starsCount>=i ? "⭐️":"☆"
        }
        return resultString
    }
}

extension DetailViewController: ItemSelectedDelegate {
    func itemSelected(item: Item) {
        itemObject = item
    }
}
