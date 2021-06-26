//
//  ViewController.swift
//  SplitVC
//
//  Created by Grifus on 10.06.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var ratingLable: UILabel!
    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    
    var item: Item?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateData()
    }
    
    func updateData() {
        guard let item = item else { return }
        imageView.image = UIImage(named: item.imageName)
        titleLable.text = item.title
        ratingLable.text = stars()
        
        if let priceVal = item.price {
            priceLable.text = "\(round(priceVal * 100) / 100) $"
        } else {
            priceLable.text = ""
        }
        
        descriptionLable.text = item.description
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.layer.cornerRadius = imageView.bounds.height / 2
    }
    
    private func stars() -> String {
        guard let item = item else { return ""}
        let ratingInt = Int(item.rating)
        var ratingStars = ""
        if ratingInt == 0 {return "☆☆☆☆☆"}
        if ratingInt == 5 {return "★★★★★"}
            
        for _ in 1...ratingInt {
            ratingStars += "★"
        }
        
        for _ in 1...5 - ratingInt {
            ratingStars += "☆"
        }
        return ratingStars
    }
}

extension DetailViewController: TableViewControllerDelegate {
    func createData(item: Item) {
        self.item = item
    }
}
