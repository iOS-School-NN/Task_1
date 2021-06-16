//
//  TableVC.swift
//  SplitVC
//
//  Created by Grifus on 10.06.2021.
//

import UIKit
import Foundation

class TableVC: UITableViewController {
    
    public static let dataArr: [Item] = [
        Item(title: "Green Mile", imageName: "GreenMile", price: nil, rating: 3.3, description: "The lives of guards on Death Row are affected by one of their charges: a black man accused of child murder and rape, yet who has a mysterious gift."),
        Item(title: "Shindlers List", imageName: "ShindlersList", price: 20.1, rating: 5.0, description: "In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis."),
        Item(title: "The Shawshank Redemption", imageName: "TheShawshankRedemption", price: 40.5331, rating: 2.2, description: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency."),
        Item(title: "Parasite", imageName: "Parasite", price: 10.231, rating: 4.889, description: "Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan."),
        Item(title: "The Lord of the Rings", imageName: "TheLordOfTheRings", price: 11, rating: 4.44, description: "Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring."),
        Item(title: "Life is beautiful", imageName: "LifeIsBeautiful", price: 22, rating: 4.12, description: "When an open-minded Jewish librarian and his son become victims of the Holocaust, he uses a perfect mixture of will, humor, and imagination to protect his son from the dangers around their camp.")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TableVC.dataArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
        
        cell.titleLable.text = TableVC.dataArr[indexPath.row].title
        
        if let price = TableVC.dataArr[indexPath.row].price {
            cell.priceLable.text = String("\(round(price * 100) / 100) $")
        } else {
            cell.priceLable.text = ""
        }
        cell.cellImage.image = UIImage(named: TableVC.dataArr[indexPath.row].imageName)

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detail = self.storyboard?.instantiateViewController(identifier: "DetailVC") as! DetailVC
        let currentItem = TableVC.dataArr[indexPath.row]
        
        detail.poster = currentItem.imageName
        detail.titleText = currentItem.title
        detail.rating = currentItem.rating
        detail.priceVal = currentItem.price
        detail.descriptionText = currentItem.description
        
        let nav = UINavigationController(rootViewController: detail)
        splitViewController?.showDetailViewController(nav, sender: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
