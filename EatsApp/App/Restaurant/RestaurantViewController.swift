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
    
    var foodTitles = [
       "Promos",
        "Sushis",
        "Suhsi especial"
    ]
    
    var foodDescription = [
        ["Sushi empanizado con la proteina que desees", "Sushi de alga con la proteina que desees"],
        ["Sushi con salmon por fuera", "Sushi de res con anguila", "Sushi de surimi con vegetales"],
        ["Sushi con salmon por fuera", "Sushi de res con anguila", "Sushi de surimi con vegetales","Sushi de surimi con vegetales"],
        
    ]
    
    //MARK: - tableview delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //Titulos de las secciones
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerframe = tableView.frame
        let title : UILabel = UILabel()
        
        title.frame = CGRect(x: 20, y: 20, width: headerframe.size.width, height: 20)
        title.text = foodTitles[section]
        title.textColor = UIColor(named: "Amarillo")
        title.font = UIFont(name: "Helvetica-Bold", size: 18.0)
        
        let headerView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: headerframe.size.width, height: headerframe.size.height))
        
        headerView.addSubview(title)
        
        return headerView
    }
    //Altura del seccion header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    //Numero de secciones
    func numberOfSections(in tableView: UITableView) -> Int {
        return foodNames.count
    }
    
    //Numero de celdas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodNames[section].count
    }
    //MARK: - tableview datasource
    //Data en las celdas
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath) as! FoodTableViewCell
        cell.nameFoodLabel?.text = foodNames[indexPath.section][indexPath.row]
        cell.priceFoodLabel?.text = foodPrice[indexPath.section][indexPath.row]
        cell.descriptionLabel?.text = foodDescription[indexPath.section][indexPath.row]
    
        return cell
    }

    //MARK: - VIEWDIDLOAD
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
