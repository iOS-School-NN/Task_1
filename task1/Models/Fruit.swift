//
//  Fruit.swift
//  task1
//
//  Created by R S on 14.06.2021.
//

import Foundation

struct Fruit {
      let title: String
    
      // Название картинки, чтобы спарсить ее из Assets
      let imageName: String
    
      // Цена (можно вписывать рандомно, но чур без огромных чисел, у одного элемента должен быть nil)
      let price: Double?
    
      // Ваша личная оценка от 1 до 5
      let myRating: Double
    
      // Описание (можно брать из википедии, либо придумать самому (не менее 15 символов))
      let description: String
}
