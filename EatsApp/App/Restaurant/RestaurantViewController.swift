//
//  RestaurantViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 09/01/21.
//

import UIKit

class RestaurantViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let data = [
        ["Apples", "Oranges"],
        ["one", "two"],
        ["1", "2","3"]
    ]
    
    //MARK: tableview delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: tableview datasource
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        cell.backgroundColor = .cyan
        return cell
    }

    //MARK: VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let header = HeaderRestaurant(frame: CGRect(x:0,y: -47,width: view.frame.size.width, height: 478))
        let footer = UIView(frame: CGRect(x:0,y: 0,width: view.frame.size.width, height: 300))
        
        footer.backgroundColor = .red
        
        tableView.tableHeaderView = header
        tableView.tableFooterView = footer
    }
    
}
