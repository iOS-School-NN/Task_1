//
//  TableViewController.swift
//  task1
//
//  Created by R S on 14.06.2021.
//

import UIKit

protocol FruitDelegate: AnyObject {
    var fruit: Fruit? { get set }
}

class MasterTableViewController: UITableViewController {
    
    let fruits: [Fruit] = [Fruit(title: "Apple", imageName: "apple", price: 20.54, myRating: 1, description: "An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus."), Fruit(title: "Artichoke", imageName: "artichoke", price: 30.65, myRating: 2, description: "The globe artichoke (Cynara cardunculus var. scolymus),[1] also known by the names French artichoke and green artichoke in the U.S.,[2] is a variety of a species of thistle cultivated as a food."), Fruit(title: "Avocado", imageName: "avocado", price: 40.24, myRating: 3, description: "The avocado (Persea americana), a tree likely originating from south-central Mexico,[3][4][5] is classified as a member of the flowering plant family Lauraceae."), Fruit(title: "Bacon", imageName: "bacon", price: 100.98, myRating: 4, description: "Bacon is a type of salt-cured pork[1] made from various cuts, typically from the pork belly or from the less fatty back cuts."), Fruit(title: "Banana", imageName: "banana", price: 50.24, myRating: 5, description: "A banana is an elongated, edible fruit – botanically a berry[1][2] – produced by several kinds of large herbaceous flowering plants in the genus Musa.["), Fruit(title: "Bell pepper", imageName: "bell-pepper", price: nil, myRating: 1, description: "The bell pepper (also known as sweet pepper, pepper, or capsicum /ˈkæpsɪkəm/)[1] is the fruit of plants in the Grossum cultivar group of the species Capsicum annuum.["), Fruit(title: "Bread", imageName: "bread", price: 60.77, myRating: 2, description: "Bread is a staple food prepared from a dough of flour and water, usually by baking."),]
    
    weak var delegate: FruitDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fruits.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = fruits[indexPath.row].title
        if let price = fruits[indexPath.row].price {
            cell.detailTextLabel?.text = "$\(String(describing: price))"
        } else {
            cell.detailTextLabel?.text = ""
        }
        let image = UIImage(named: fruits[indexPath.row].imageName)
        cell.imageView?.image = image
        cell.imageView?.layer.cornerRadius = 50
        cell.imageView?.backgroundColor = UIColor.brown
        cell.imageView?.layer.masksToBounds = true
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.fruit = fruits[indexPath.row]
        guard let detailVC = delegate as? DetailViewController, let detailNC = detailVC.navigationController else { return }
        splitViewController?.showDetailViewController(detailNC, sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
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
