//
//  LocationsViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 22/01/21.
//

import UIKit

struct userAddres {
    var street: String
    var location: String
}

class LocationsViewController: UIViewController, UITableViewDataSource, UITabBarDelegate, UITableViewDelegate {
    
    let user = [
        userAddres(street: "Zaragoza #21 centro 28000", location: "Colima, col"),
        userAddres(street: "Calle 25", location: "Tecoman, col")
    ]
    
    @IBOutlet weak var locationsTableView: UITableView!
    
    //MARK: - DELEGATE
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        if  locationsTableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark{
            locationsTableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if locationsTableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.none{
            locationsTableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
    }

    //MARK: - DATA SOURCE
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = locationsTableView.dequeueReusableCell(withIdentifier: "locCell") as? LocationTableViewCell else {
            fatalError()
        }
        cell.locationLabel.text = user[indexPath.row].location
        cell.addressLabel.text = user[indexPath.row].street
        
        return cell
    }
   
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationsTableView.delegate = self
        self.locationsTableView.dataSource = self
        
    }

}
