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
    
    var restaurantIsFavorite = Array(repeating: false, count: 21)
    
    var restaurantIsVisited = [false, false, false, false, false, false, false , false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    
    lazy var dataSource = configureDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        tableView.separatorStyle = .none
        
        var snapShoot = NSDiffableDataSourceSnapshot<Section,String>()
        snapShoot.appendSections([.all])
        snapShoot.appendItems(restaurantNames, toSection: .all)
        
        dataSource.apply(snapShoot, animatingDifferences: false)
        
        tableView.cellLayoutMarginsFollowReadableWidth = true
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: nil, message: "What do you do?", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let reserveActionHandler = {(action:UIAlertAction!) -> Void in
            let alertMassage = UIAlertController(title: "Not Available yer", message: "Sorry, this feature is not available yet.", preferredStyle: .alert)
            alertMassage.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            self.present(alertMassage, animated: true, completion: nil)
        }
        let reserveAction = UIAlertAction(title: "Reserve Table", style: .default, handler: reserveActionHandler)
        alert.addAction(reserveAction)
        alert.addAction(cancel)
        
        
        // action image
        let actionFavorit = self.restaurantIsFavorite[indexPath.row] ? "Remove from favorite" : "Mark as favorite"
        let favorit = UIAlertAction(title: actionFavorit, style: .default, handler: {(action:UIAlertAction!) -> Void in
        let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
        
        cell.imaFav.isHidden = self.restaurantIsFavorite[indexPath.row]
        self.restaurantIsFavorite[indexPath.row] = self.restaurantIsFavorite[indexPath.row] ? false : true
                                    
        })
        alert.addAction(favorit)
    
        present(alert, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: false)
    }

    
    enum Section {
        case all
    }
    
    func configureDataSource() -> UITableViewDiffableDataSource<Section,String>{
        let cellIdentiIdentifier = "dataCell"
        let dataSource = UITableViewDiffableDataSource<Section,String>(
            tableView: tableView, cellProvider: {
                tableView,indexPath, restaurantNames in
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentiIdentifier, for: indexPath) as! TableViewCell
                
                cell.img.image = UIImage(named: self.restaurantImages[indexPath.row])
                cell.lblName.text = restaurantNames
                cell.lblLocation.text = self.restaurantLocations[indexPath.row]
                cell.lblType.text = self.restaurantTypes[indexPath.row]
//                cell.accessoryType = self.restaurantIsFavorite[indexPath.row] ?.checkmark : .none
                cell.imaFav.isHidden = self.restaurantIsFavorite[indexPath.row] ? false:true
                return cell
            }
        )
        return dataSource
    }
}
