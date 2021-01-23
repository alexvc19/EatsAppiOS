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
    
    @IBOutlet weak var locationsTableView: UITableView!
    @IBOutlet weak var addLocation: UITextField!{
        didSet{
            addLocation.layer.borderWidth = 0.5
            addLocation.layer.borderColor = UIColor(named: "Amarillo")?.cgColor
            addLocation.layer.cornerRadius = 6
            let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
            addLocation.leftView = leftView
            addLocation.leftViewMode = .always
        }
    }
    
    let user = [
        userAddres(street: "Zaragoza #21 centro 28000", location: "Colima, col"),
        userAddres(street: "Calle 25", location: "Tecoman, col")
    ]
    
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
        
        let tapGesture = UITapGestureRecognizer(target: self, action:     #selector(tapGestureHandler))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func tapGestureHandler() {
        addLocation.endEditing(true)
    }
}
