//
//  detailViewModel.swift
//  Task_1
//
//  Created by KirRealDev on 15.06.2021.
//

import Foundation

final class DetailViewModel {
    private var item: ItemModel?
    var title: String { return item?.title ?? "No title" }
    var imageName: String { return item?.imageName ?? "No image" }
    var price: String { return item?.formattedPrice ?? "No price" }
    var myRating: String { return item?.formattedMyRating ?? "No rating" }
    var description: String { return item?.description ?? "No description" }
    
    func configure(_ item: ItemModel) {
        self.item = item
    }
}
