//
//  masterViewModel.swift
//  Task_1
//
//  Created by KirRealDev on 18.06.2021.
//

import Foundation

final class MasterViewModel {
    private let filmsData: [ItemModel] = [
        ItemModel(title: "Начало", imageName: "Inception", price: 20.838, myRating: 9.38, description: "Шпионаж фантастического уровня. С помощью сверхтехнологии герой Ди Каприо и его команда проникают в чужие сны."),
        ItemModel(title: "Зеленая миля", imageName: "GreenMile", price: nil, myRating: 8.5, description: "В тюрьме для смертников появляется заключенный с божественным даром. Мистическая драма по роману Стивена Кинга."),
        ItemModel(title: "Облачный Атлас", imageName: "CloudAtlas", price: 25, myRating: 9.725, description: "Шесть историй - пять реинкарнаций, происходящих в разное время, тесно переплетаются между собой..."),
        ItemModel(title: "Довод", imageName: "Tenet", price: 33.43, myRating: 7, description: "Протагонист пытается обезвредить террориста с помощью уникальной технологии. Блокбастер-пазл Кристофера Нолана."),
        ItemModel(title: "Джентльмены", imageName: "TheGentlemen", price: 27.89, myRating: 8.915, description: "Успешное возвращение Гая Ричи к корням — острая и живая криминальная комедия с блестящим актерским составом."),
        ItemModel(title: "Матрица", imageName: "Matrix", price: 15.02, myRating: 9.19, description: "Хакер Нео узнает, что его мир — виртуальный. Выдающийся экшен, доказавший, что зрелищное кино может быть умным.")
    ]
    
    func getDataBy(index: Int) -> ItemModel {
        return filmsData[index]
    }
    func getCountOfFilms() -> Int {
        return filmsData.count
    }
}
