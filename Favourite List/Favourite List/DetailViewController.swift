//
//  DetailViewController.swift
//  Favourite List
//
//  Created by Step ToVictory on 29.06.2021.
//

import UIKit

class DetailViewController: UIViewController, ItemDetailView {
    var item: Item? {
        didSet {
            set()
        }
    }
    
    @IBOutlet weak var itemDetailImage: UIImageView!
    
    
    @IBOutlet weak var itemDetailTitle: UILabel!
    
    @IBOutlet weak var itemRating: UILabel!
    @IBOutlet weak var itemDetailPrice: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var navItem: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        itemDetailImage.layer.cornerRadius = itemDetailImage.bounds.width / 4
        itemDetailImage.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner]
        view.backgroundColor = .white
        itemDetailTitle.font = UIFont.boldSystemFont(ofSize: 20)
       

        // Do any additional setup after loading the view.
    }
    
    func set() {
            guard let item = item else { return }
            loadViewIfNeeded()
        let img = UIImage(named: item.imageName)
        itemDetailImage.image = img
        itemDetailImage.clipsToBounds = true
            
            
        itemDetailTitle.text = item.title
        if let itemPrice = item.price  {
            itemDetailPrice.isHidden = false
            itemDetailPrice.text = "RUB \(String(describing: itemPrice))"
            } else {
                itemDetailPrice.isHidden = true
            }
        itemDescription.text = String(describing: item.description)
            
        itemRating.text = "Rating: " + String(item.myRating) + "/5.0"
        
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
