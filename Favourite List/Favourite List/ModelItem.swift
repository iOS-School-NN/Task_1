//
//  ModelItem.swift
//  Favourite List
//
//  Created by Step ToVictory on 29.06.2021.
//

import Foundation

struct Item
{
    // Название элемента

       var title: String
     

       // Название картинки, чтобы спарсить ее из Assets

       var imageName: String
     

       // Цена (можно вписывать рандомно, но чур без огромных чисел, у одного элемента должен быть nil)

       var price: Double?
     

       // Ваша личная оценка от 1 до 5

       var myRating: Double
     

       // Описание (можно брать из википедии, либо придумать самому (не менее 15 символов))

       var description: String
    
}
