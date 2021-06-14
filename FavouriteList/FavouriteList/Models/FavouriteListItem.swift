//
//  FavouriteListItem.swift
//  FavouriteList
//
//  Created by Alexander on 13.06.2021.
//

import UIKit

struct FavouriteListItem {
    let title: String
    let imageName: String
    let price: Double?
    let myRating: Double
    let description: String
    
    var starsRatingString: String {
        "Рейтинг: " + Array(repeating: "⭐️", count: Int(myRating)).joined()
    }
    
    var roundedPriceString: String? {
        guard let price = self.price else { return nil }
        return String(format: "%.2f руб.", price)
    }
    
    var image: UIImage? {
        UIImage(named: imageName)
    }
}
