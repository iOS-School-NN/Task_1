import UIKit.UIImage

/*
Структура определяет сущность блюда:
 - Cтрана происхождения
 - Название блюда
 - Изображение блюда
 - Информация о блюде
 - Средняя цена в заведениях (USD)
 - Рейтинг (от 0 до 5)
 */

struct Food {
    let country: String
    let title: String
    let image: UIImage?
    let description: String
    let price: Float?

    //Ограничения диапозона для рейтинга блюда
    var rating: Float {
        didSet {
            if rating > 5 {
                rating = 5
            } else if rating < 0 {
                rating = 0
            }
        }
    }
}
