//
//  AccountViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 02/01/21.
//

import UIKit

class AccountViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var accountTableView: UITableView!
    
    let icons = [
        "person.crop.rectangle.fill",
        "creditcard.fill",
        "mappin.circle.fill",
        "questionmark",
        "arrow.right"
    ]
    
    let optionsNames = [
        "Informacion personal",
        "Formas de pago",
        "Direcciones",
        "Ayuda",
        "Cerrar sesion"
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = accountTableView.dequeueReusableCell(withIdentifier: "optionscell", for: indexPath) as! OptionsTableViewCell
        
        cell.optionIconImageView.image = UIImage(systemName: icons[indexPath.row])
        cell.optionLabel.text = optionsNames[indexPath.row]
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let header = HeaderAccount(frame: CGRect(x: 0, y: 0, width:view.frame.width, height: 207))
        
        accountTableView.tableHeaderView = header
       
    }
}


