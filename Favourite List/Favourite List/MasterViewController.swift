//
//  MasterViewController.swift
//  Favourite List
//
//  Created by Step ToVictory on 29.06.2021.
//

import UIKit

protocol ItemDelegate: AnyObject {
    var item: Item? { get set }
}

class MasterViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    let chocolate: [Item] = [Item(title: "Ritter Sport", imageName: "ritter", price: 109.99, myRating: 5, description: "Ritter Sport — немецкая марка шоколада, которая продаётся во многих странах мира. Каждая плитка имеет форму квадрата и разделена на 16, реже на 4, 9 или 25 меньших по размеру квадратов."), Item(title: "Milka", imageName: "milka", price: 69.99, myRating: 3, description: "Milka — бренд шоколада, принадлежащий компании Mondelēz International. Основное производство уже более ста лет находится в Лёррахе (Германия). Название Milka было образовано из двух немецких слов — Milch (молоко) и Kakao (какао), по названиям главных ингредиентов. Под маркой Milka также выпускают шоколадное печенье, конфеты и другие кондитерские изделия."), Item(title: "Russia", imageName: "rossiya", price: 59.99, myRating: 3, description: "«Россия» — советская и российская шоколадная фабрика в Самаре, основанная в 1969 году. С 1995 года принадлежит швейцарской компании Nestlé. По состоянию на 2010-е годы на фабрике производится более 170 наименований шоколадной и прочей кондитерской продукции под брендами «„Россия“ — щедрая душа!»"), Item(title: "Alpen Gold", imageName: "alpen", price: 39.99, myRating: 2, description: "Альпен Гольд (англ. Alpen Gold) — бренд кондитерских изделий, созданный Stollwerck AG для рынков бывших социалистических стран и проданный компании Kraft Foods. Под данной торговой маркой выпускаются шоколад и мороженое. Альпен Гольд — лидер в сегменте плиточного шоколада по итогам 2018 года. Продукция компании представлена в России, Казахстане, Киргизии, Белоруссии, Польше, Грузии, Азербайджане, Армении, Монголии, Узбекистане, Таджикистане и Туркмении. Ранее продавалась на Украине. Все заводы расположены на территории стран Восточной Европы."), Item(title: "Toblerone", imageName: "toblerone", price: 199.99, myRating: 5, description: "Toblerone (произносится: Тоблеро́н) — шоколадный батончик, расфасованный в виде долек из сладких пирамидок, напоминающих культовую гору Маттерхорн. Выпускается в Швейцарии с 1908 года.В настоящее время производится компанией Kraft Foods (Switzerland), торговая марка Mondelēz International.")]
    
    weak var delegate: ItemDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MasterViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chocolate.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MasterTableViewCell

        cell?.itemTitle?.text = chocolate[indexPath.row].title
                if let price = chocolate[indexPath.row].price {
                    cell?.itemPrice?.text = "$\(String(describing: price))"
                } else {
                    cell?.itemPrice?.text = ""
                }
        let image = UIImage(named: chocolate[indexPath.row].imageName)
        cell?.itemImage?.image = image
        cell?.itemImage?.layer.cornerRadius = 50
        cell?.itemImage?.backgroundColor = UIColor.brown
        cell?.itemImage?.layer.masksToBounds = true
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            delegate?.item = chocolate[indexPath.row]
            guard let detailVC = delegate as? DetailViewController, let detailNC = detailVC.navigationController else { return }
            splitViewController?.showDetailViewController(detailNC, sender: nil)
            
    showDetailViewController(UINavigationController(rootViewController: detailVC), sender: nil)
        }
}
