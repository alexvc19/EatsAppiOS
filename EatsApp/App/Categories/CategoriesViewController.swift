//
//  CategoriesViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 27/01/21.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var categoriesTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Header TableView
        let header = CategoriesHeaderView(frame: CGRect(x: 0, y: 0, width:view.frame.width, height: 340))
        
        categoriesTableView.tableHeaderView = header
        
    }

}
extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoriesTableView.dequeueReusableCell(withIdentifier: "restaurantCell", for: indexPath)
        
        cell.textLabel?.text = "Table cell test"
        
        return cell
    }
    
    
}
