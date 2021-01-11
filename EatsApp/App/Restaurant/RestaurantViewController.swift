//
//  RestaurantViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 09/01/21.
//

import UIKit

class RestaurantViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let foodNames = [
        //primera seccion
        ["Sushi enpanizado", "Sushi california"],
        //segunda seccion
        ["Sushi salmon", "Sushi kegiko roll", "Sashimi"],
        //tercera seccion
        ["Temaki", "Gunkan","Nigiri","Uramaki"]
    ]
    
    let foodPrice = [
        ["2 x $120.00","2 x $120.00"],
        
        ["$120.00","$120.00","$120.00"],
        
        ["$120.00","$120.00","$120.00","$120.00"],
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
        return foodNames.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodNames[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath) as! FoodTableViewCell
        cell.nameFoodLabel?.text = foodNames[indexPath.section][indexPath.row]
        cell.priceFoodLabel?.text = foodPrice[indexPath.section][indexPath.row]
    
        return cell
    }

    //MARK: VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let header = HeaderRestaurant(frame: CGRect(x:0,y: -47,width: view.frame.size.width, height: 493))
        let footer = UIView(frame: CGRect(x:0,y: 0,width: view.frame.size.width, height: 300))
        
        footer.backgroundColor = .red
        
        tableView.tableHeaderView = header
        tableView.tableFooterView = footer
        
        let backBTN = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: navigationController, action: nil)
        backBTN.tintColor = UIColor(named: "Amarillo")
        backBTN.title = "Back"
        navigationItem.leftBarButtonItem = backBTN
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
}
