//
//  ItemCellModel.swift
//  Task_1
//
//  Created by KirRealDev on 19.06.2021.
//

import Foundation

final class ItemCellModel {
    private var item: ItemModel?
    var title: String { return item?.title ?? "is empty" }
    var imageName: String { return item?.imageName ?? "is empty" }
    var price: String? {
        guard let checkedPrice = item?.price else {
            return "is empty"
        }
        return String(format: "$%.02f", checkedPrice)
    }
    
    func configure(_ item: ItemModel) {
        self.item = item
    }
    
}
