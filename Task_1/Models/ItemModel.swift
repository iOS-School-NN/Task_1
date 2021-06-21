//
//  DataModel.swift
//  Task_1
//
//  Created by KirRealDev on 12.06.2021.
//

import Foundation

struct ItemModel {
    let title: String // Название элемента
    let imageName: String // Название картинки, чтобы спарсить ее из Assets
    let price: Double? // Цена
    let myRating: Double // Оценка от 1 до 5
    let description: String // Описание (не менее 15 символов)

}
