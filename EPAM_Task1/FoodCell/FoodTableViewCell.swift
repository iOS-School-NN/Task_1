import UIKit

//Класс ответственный за поведение ячейки блюда

final class FoodTableViewCell: UITableViewCell {
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    static let reuseIdentifier = "Food Cell"

    //Установка блюда для ячейки и её обновление
    var food: Food? {
        didSet {
            updateInformation()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        //Закругление верхнего правого и нижнего левого угла у изображения
        foodImage.layer.cornerRadius = foodImage.bounds.width / 4
        foodImage.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        //Выделение при выборе
        contentView.backgroundColor = selected ? .systemBlue.withAlphaComponent(0.1) : .clear
    }

    private func updateInformation() {
        foodImage.image = food?.image
        countryLabel.text = food?.country.uppercased()
        titleLabel.text = food?.title

        if let foodPrice = food?.price {
            priceLabel.text = String(format: "%.2f $", foodPrice)
        }

        priceLabel.isHidden = food?.price == nil
    }
}
