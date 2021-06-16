import UIKit

//Класс ответственный за поведение окна с подробной информацией о блюде
final class DetailFoodViewController: UIViewController {

    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    var food: Food? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.updateInformation()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Закругление верхнего правого и нижнего левого угла
        foodImage.layer.cornerRadius = foodImage.bounds.width / 4
        foodImage.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner]
    }

    //Обновление информации в соответствии с текущим блюдом
    private func updateInformation() {
        guard let food = food else {
            return
        }

        foodImage.image = food.image
        titleLabel.text = food.title

        if let foodPrice = food.price {
            priceLabel.text = String(format: "%.2f $", foodPrice)
        }
        
        priceLabel.isHidden = food.price == nil

        descriptionLabel.text = food.description
        ratingLabel.text = "Rating: \(ratingToStars(food.rating))"
    }

    //Конвертация рейтинга в строку звезд  (3.5 -> ★★★★☆) (2.2 -> ★★☆☆☆)
    private func ratingToStars(_ rating: Float) -> String {
        let numberOfStars = Int(round(rating))
        var starString = String()

        for number in 1...5 {
            starString += number <= numberOfStars ? "★" : "☆"
        }

        return starString
    }
}

//Реализация протокола делегата masterVC
extension DetailFoodViewController: MasterFoodViewControllerDelegate {
    func newFood(_ food: Food) {
        self.food = food
    }
}
