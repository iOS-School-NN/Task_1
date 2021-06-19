//
//  MasterViewModel.swift
//  Task_1
//
//  Created by KirRealDev on 18.06.2021.
//

import Foundation

final class MasterViewModel {
    private let filmsData: [ItemModel] = [
        ItemModel(title: "Inception", imageName: "Inception", price: 10.838, myRating: 4.38, description: "шпионаж фантастического уровня. С помощью сверхтехнологии герой Ди Каприо и его команда проникают в чужие сны."),
        ItemModel(title: "Green Mile", imageName: "GreenMile", price: nil, myRating: 4.5, description: "в тюрьме для смертников появляется заключенный с божественным даром. Мистическая драма по роману Стивена Кинга."),
        ItemModel(title: "Cloud Atlas", imageName: "CloudAtlas", price: 14, myRating: 5.0, description: "Шесть историй - пять реинкарнаций, происходящих в разное время, тесно переплетаются между собой..."),
        ItemModel(title: "Tenet", imageName: "Tenet", price: 13.43, myRating: 3.27, description: "протагонист пытается обезвредить террориста с помощью уникальной технологии. Блокбастер-пазл Кристофера Нолана."),
        ItemModel(title: "The Gentlemen", imageName: "TheGentlemen", price: 12.89, myRating: 3.815, description: "успешное возвращение Гая Ричи к корням — острая и живая криминальная комедия с блестящим актерским составом."),
        ItemModel(title: "The Matrix", imageName: "Matrix", price: 11.02, myRating: 4.19, description: "хакер Нео узнает, что его мир — виртуальный. Выдающийся экшен, доказавший, что зрелищное кино может быть умным.")
    ]
    
    func getDataBy(index: Int) -> ItemModel {
        return filmsData[index]
    }
    func getCountOfFilms() -> Int {
        return filmsData.count
    }
    
}
