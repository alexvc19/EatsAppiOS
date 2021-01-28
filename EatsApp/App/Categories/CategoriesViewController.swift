//
//  CategoriesViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 27/01/21.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var categoriesTableView: UITableView!
    
    var cellNib = "restaurantCell"
    
    let restNames = [
        "Okuma",
        "TuSushi",
        "Sushido",
        "Megumi",
        "Estilo oriental"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Header TableView
        let header = CategoriesHeaderView(frame: CGRect(x: 0, y: 0, width:view.frame.width, height: 360))
        
        categoriesTableView.register(UINib(nibName: "RestaurantsTableViewCell", bundle: nil), forCellReuseIdentifier: cellNib)
        
        categoriesTableView.tableHeaderView = header
        self.categoriesTableView.dataSource = self
        self.categoriesTableView.delegate = self
    }

}
extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = categoriesTableView.dequeueReusableCell(withIdentifier: cellNib, for: indexPath) as? RestaurantsTableViewCell else {
            fatalError()
        }
        
        cell.restaurantNameLabel.text = restNames[indexPath.row]
        cell.estimateTimeLabel.text = "20 - 30 minutos"
        cell.deliveryCost.text = "$30.00"
        
        return cell
    }
    
    
}
