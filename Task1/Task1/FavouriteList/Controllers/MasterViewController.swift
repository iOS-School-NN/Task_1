//
//  MasterViewController.swift
//  Task1
//
//  Created by Mary Matichina on 13.06.2021.
//

import UIKit
import DeviceKit

class MasterViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    
    private var selectedItem: Items?
    private var filmItems: [Items] = [
        Items(iconName: Asset.shawshank.image, title: L10n.shawshank, price: 100, descr: L10n.shawshankDescr, rating: 0.7),
        Items(iconName: Asset.mile.image, title: L10n.mile, price: 200.5352828, descr: L10n.mileDescr, rating: 2.44),
        Items(iconName: Asset.interstellar.image, title: L10n.interstellar, price: 300.099888, descr: L10n.interstellarDesr, rating: 3.6),
        Items(iconName: Asset.forrest.image, title: L10n.forrest, price: 400.54677, descr: L10n.forrestDescr, rating: 4.7),
        Items(iconName: Asset.king.image, title: L10n.king, price: nil, descr: L10n.kingDescr, rating: 5.5)
    ]
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavBar()
    }
    
    // MARK: Configure
    
    private func configureTableView() {
        tableView.separatorStyle = .none
        
        if Device.current.isPad {
            tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        }
    }
    
    private func configureNavBar() {
        title = L10n.films
    }
}

// MARK: Extensions

extension MasterViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FavouriteTableViewCell.createForTableView(tableView) as! FavouriteTableViewCell
        let item = filmItems[indexPath.row]
        cell.configure(item.iconName, item.title, item.price)
        return cell
    }
}

extension MasterViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItem = filmItems[indexPath.row]
        
        if let controller = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController {
            controller.detailItem = selectedItem
            self.showDetailViewController(UINavigationController(rootViewController: controller), sender: nil)
        }
    }
}
