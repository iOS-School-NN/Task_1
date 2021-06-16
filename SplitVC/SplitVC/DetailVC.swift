//
//  ViewController.swift
//  SplitVC
//
//  Created by Grifus on 10.06.2021.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var ratingLable: UILabel!
    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    
    var poster = TableVC.dataArr[0].imageName
    var titleText = TableVC.dataArr[0].title
    var rating = TableVC.dataArr[0].rating
    var priceVal: Double? = TableVC.dataArr[0].price
    var descriptionText = TableVC.dataArr[0].description

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: poster)
        titleLable.text = titleText
        ratingLable.text = stars()
        
        if let priceVal = priceVal {
            priceLable.text = "\(round(priceVal * 100) / 100) $"
        } else {
            priceLable.isHidden = true
        }
        
        descriptionLable.text = descriptionText
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageView.layer.cornerRadius = imageView.bounds.height / 2
        
        if priceVal == nil {
            descriptionLable.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 40).isActive = true
        }
    }
    
    private func stars() -> String {
        let ratingInt = Int(rating)
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
