//
//  MasterViewController.swift
//  FavouriteList
//
//  Created by Alexander on 12.06.2021.
//

import UIKit

protocol CellSelectableDelegate: AnyObject {
    func didSelect(item: FavouriteListItem)
}

class MasterViewController: UITableViewController {
    
    weak var delegate: CellSelectableDelegate?
    var favouriteListData = [FavouriteListItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteListData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavouriteListCell.cellId, for: indexPath)
        guard let typedCell = cell as? FavouriteListCell else { assertionFailure(); return cell }
        
        typedCell.fill(item: favouriteListData[indexPath.row])
        return typedCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelect(item: favouriteListData[indexPath.row])
    }
    
    private func configureData() {
        let service = FavouriteListService()
        favouriteListData = service.createFavouriteList()
    }
}
