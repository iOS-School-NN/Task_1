import UIKit

//Протокол делегата для передачи блюда в DetailVC
protocol MasterFoodViewControllerDelegate {
    func newFood(_ food: Food)
}

//Класс ответственный за поведение окна списка блюд
final class MasterFoodViewController: UITableViewController {
    var delegate: MasterFoodViewControllerDelegate?
    
    let food = FoodModel.fetchFood()

    override func viewDidLoad() {
        super.viewDidLoad()

        //Выбор первого блюда после запуска приложения
        tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .top)
        delegate?.newFood(food.first!)
    }

    //Количество секций в списке блюд
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //Количество строк в таблице блюд
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return food.count
    }

    //Инициализация строки в списке блюд
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let foodCell = tableView.dequeueReusableCell(withIdentifier: FoodTableViewCell.reuseIdentifier) as? FoodTableViewCell else { return UITableViewCell() }

        foodCell.food = food[indexPath.row]

        return foodCell
    }

    //Обработка выбора блюда (переход к detailVC и его изменение)
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = delegate as? DetailFoodViewController else {
            return
        }
        
        detailVC.newFood(food[indexPath.row])
        showDetailViewController(UINavigationController(rootViewController: detailVC), sender: nil)
    }

}
