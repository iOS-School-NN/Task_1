//
//  MasterTableViewController.swift
//  FavouriteList
//
//  Created by Daria Tokareva on 16.06.2021.
//

import UIKit
protocol ItemSelectedDelegate {
    func itemSelected(item: Item)
}
class MasterTableViewController: UITableViewController {

    let identifier = "reuseIdentifier"
    let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
    var items = Item.getItemsArray()
    
    var delegate: ItemSelectedDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
//        navigationController?.hidesBarsOnSwipe = true
        tableView.register(cellNib, forCellReuseIdentifier: identifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TableViewCell
        cell.set(item: items[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailViewController = delegate as? DetailViewController else {return}
        let currentItem = items[indexPath.row]
        detailViewController.itemSelected(item: currentItem)
        
        showDetailViewController(UINavigationController(rootViewController: detailViewController), sender: nil)
    }
}
