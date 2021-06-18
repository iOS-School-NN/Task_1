//
//  ViewController.swift
//  task1
//
//  Created by R S on 14.06.2021.
//

import UIKit

class DetailViewController: UIViewController, FruitDelegate {
    var fruit: Fruit? {
        didSet {
            setUI()
        }
    }
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var fruitTitle: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var descriptionFruit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        image.layer.cornerRadius = image.bounds.height / 2
        image.clipsToBounds = true
    }
    
    func setUI() {
        guard let fruit = fruit else { return }
        loadViewIfNeeded()
        let img = UIImage(named: fruit.imageName)
        image.image = img
        image.layer.cornerRadius = image.bounds.height / 2
        image.clipsToBounds = true
        image.backgroundColor = UIColor.brown
        
        
        fruitTitle.text = fruit.title
        if let fruitPrice = fruit.price  {
            price.isHidden = false
            price.text = "$\(String(describing: fruitPrice))"
        } else {
            price.isHidden = true
        }
        descriptionFruit.text = String(describing: fruit.description)
        
        let attachment = NSTextAttachment()
        attachment.image = UIImage(systemName: "star.fill")
        let imageString = NSMutableAttributedString(attachment: attachment)
        let arr = Array(repeating: "", count: Int(fruit.myRating))
        let string = NSMutableAttributedString(string: "Rating ")
        for _ in arr.enumerated() {
            string.append(imageString)
        }
        
        rating.attributedText = string
        rating.sizeToFit()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        setUI()
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
