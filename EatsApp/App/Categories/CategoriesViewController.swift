//
//  CategoriesViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 27/01/21.
//

import UIKit

struct ResData {
    var name: String
    var deliveryCost: String
    var estimateTime: String
    
}

class CategoriesViewController: UIViewController {

    @IBOutlet weak var categoriesTableView: UITableView!
    
    var cellNib = "restaurantCell"
    
    let restaurats = [
        ResData(name: "Okuma", deliveryCost: "$20.00", estimateTime: "30 - 40 minutos"),
        ResData(name: "TuSushi", deliveryCost: "$30.00", estimateTime: "30 - 40 minutos"),
        ResData(name: "Sushido", deliveryCost: "$25.00", estimateTime: "30 - 40 minutos"),
        ResData(name: "Megumi", deliveryCost: "$18.00", estimateTime: "30 - 40 minutos"),
        ResData(name: "Estilo oriental", deliveryCost: "$23.00", estimateTime: "30 - 40 minutos")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Header TableView
        let header = CategoriesHeaderView(frame: CGRect(x: 0, y: 0, width:view.frame.width, height: 350))
        
        categoriesTableView.register(UINib(nibName: "RestaurantsTableViewCell", bundle: nil), forCellReuseIdentifier: cellNib)
        
        categoriesTableView.tableHeaderView = header
        self.categoriesTableView.dataSource = self
        self.categoriesTableView.delegate = self
    }

}
extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return restaurats.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 297
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = categoriesTableView.dequeueReusableCell(withIdentifier: cellNib, for: indexPath) as? RestaurantsTableViewCell else {
            fatalError()
        }
        DispatchQueue.main.async {
            cell.photoImageView.roundCorners([.topLeft, .topRight], radius: 5)
        }
        cell.selectionStyle = .none
        cell.restaurantNameLabel?.text = restaurats[indexPath.section].name
        cell.estimateTimeLabel?.text = restaurats[indexPath.section].estimateTime
        cell.deliveryCost?.text = restaurats[indexPath.section].deliveryCost
        
        return cell
    }
    
    
}
