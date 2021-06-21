//
//  DetailViewModel.swift
//  Task_1
//
//  Created by KirRealDev on 15.06.2021.
//

import Foundation

final class DetailViewModel {
    private var item: ItemModel?
    
    var title: String { return item?.title ?? "Title: is empty" }
    var imageName: String { return item?.imageName ?? "is empty" }
    var price: String {
        guard let checkedPrice = item?.price else {
            return "Price: is empty"
        }
        return "Price: " + String(format: "$%.02f", checkedPrice)
    }
    var myRating: String {
        let minCountOfStars = 0
        let maxCountOfStars = 5
        
        guard let checkedMyRating = item?.myRating else {
            return "Rating: is empty"
        }
        
        let roundMyRating = Int(checkedMyRating)
        if (roundMyRating >= maxCountOfStars) {
           return "Rating: ★★★★★"
        }
        if (roundMyRating <= minCountOfStars) {
            return "Rating: ☆☆☆☆☆"
        }
        
        var formatedRating: String = ""
        for i in 0..<maxCountOfStars {
            if (i < roundMyRating) {
                formatedRating.append("★")
            }
            else {
                formatedRating.append("☆")
            }
        }
        return "Rating: " + formatedRating
    }
    
    var description: String { return item?.description ?? "is empty" }
    
    func configure(_ item: ItemModel) {
        self.item = item
    }
    
}
