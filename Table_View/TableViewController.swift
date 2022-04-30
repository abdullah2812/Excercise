//
//  TableViewController.swift
//  Table_View
//
//  Created by Irianda on 29/04/22.
//

import UIKit

class TableViewController: UITableViewController {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "P etite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery" , "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Av enue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkee", "posatelier", "bourkestreetbakery", "haigh", "palom ino", "upstate", "traif", "graham", "waffleandwolf", "fiveleaves", "cafelo re", "confessional", "barrafina", "donostia", "royaloak", "cask"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Ko ng", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "N ew York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", " British", "Thai"]
    
    lazy var dataSource = configureDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        tableView.separatorStyle = .none
        
        var snapShoot = NSDiffableDataSourceSnapshot<Section,String>()
        snapShoot.appendSections([.all])
        snapShoot.appendItems(restaurantNames, toSection: .all)
        
        dataSource.apply(snapShoot, animatingDifferences: false)
        
    }

    enum Section {
        case all
    }
    
    func configureDataSource()-> UITableViewDiffableDataSource<Section,String>{
        let cellIdentiIdentifier = "dataCell"
        let dataSource = UITableViewDiffableDataSource<Section,String>(
            tableView: tableView, cellProvider: {
                tableView,indexPath, restaurantNames in
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentiIdentifier, for: indexPath) as! TableViewCell
                
                cell.img.image = UIImage(named: self.restaurantImages[indexPath.row])
                cell.lblName.text = restaurantNames
                cell.lblLocation.text = self.restaurantLocations[indexPath.row]
                cell.lblType.text = self.restaurantTypes[indexPath.row]
                return cell
            }
        )
        return dataSource
    }
}
