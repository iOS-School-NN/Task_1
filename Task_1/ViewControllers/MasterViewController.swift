//
//  MasterViewController.swift
//  Task_1
//
//  Created by KirRealDev on 15.06.2021.
//

import UIKit

class MasterViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    private let itemTableViewIdentifier = "itemCell"
    private let detailNavigationIdentifier = "detailNavigation"
    
    private let masterModel = MasterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Favourite Films"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        configureTableView()
    }

}

extension MasterViewController {
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: String(describing: ItemMasterTableViewCell.self), bundle: nil), forCellReuseIdentifier: itemTableViewIdentifier)
        tableView.reloadData()
    }
}

extension MasterViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 89
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return masterModel.getCountOfFilms()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: itemTableViewIdentifier) as? ItemMasterTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(masterModel.getDataBy(index: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard
            let navigationDetailController = storyboard?.instantiateViewController(identifier: detailNavigationIdentifier) as? UINavigationController,
            let detailVC = navigationDetailController.viewControllers.first as? DetailViewController
        else { return }
        detailVC.configure(item: masterModel.getDataBy(index: indexPath.row))
        showDetailViewController(navigationDetailController, sender: self)
    }
    
}
