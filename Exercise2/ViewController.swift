//
//  ViewController.swift
//  Exercise2
//
//  Created by Irianda on 12/04/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
 
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "P etite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery" , "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Av enue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confes sional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]

    var imageRestaurant = [UIImage(named: "Barrafina"), UIImage(named: "Homei"), UIImage(named: "Bourke Street Bakery"), UIImage(named: "Cafe Deadend"), UIImage(named: "Cafe Loisl"), UIImage(named: "Cafe Lore"), UIImage(named: "CASK Pub and Kitchen"), UIImage(named: "Confessional"), UIImage(named: "Donostia"), UIImage(named: "Five Leaves"), UIImage(named: "For Kee Restaurant"), UIImage(named: "Graham Avenue Meats And Deli"), UIImage(named: "Haigh's Chocolate"), UIImage(named: "Palomino Espresso"), UIImage(named: "Petite Oyster"), UIImage(named: "Po's Atelier"), UIImage(named: "Royal Oak"), UIImage(named: "Teakha"), UIImage(named: "Waffle & Wolf"), UIImage(named: "Traif"), UIImage(named: "Upstate")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "dataCells"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = restaurantNames[indexPath.row]
        cell.imageView?.image = imageRestaurant[indexPath.row]
        
        return cell
    }

}

