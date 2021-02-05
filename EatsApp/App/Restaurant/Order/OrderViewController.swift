//
//  OrderViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 29/01/21.
//

import UIKit

class OrderViewController: UIViewController {
    
    @IBOutlet weak var orderTableview: UITableView!
    @IBOutlet weak var buttonContentView: UIView!
    @IBOutlet weak var addItemButtom: UIButton!
    
    let data = [
        ["Camaron","Res","Salmon","Alga"],
        ["Camaron","Res","Salmon","Alga"],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let header = HeaderOrder(frame: CGRect(x: 0.0, y: 0.0, width: view.frame.size.width, height: 410.0))
        
        orderTableview.tableHeaderView = header
    }
}
extension OrderViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //select mark por section
        for row in 0..<tableView.numberOfRows(inSection: indexPath.section) {
            if let cell = tableView.cellForRow(at: IndexPath(row: row, section: indexPath.section)) {
                cell.accessoryType = row == indexPath.row ? .checkmark : .none
            }
        }
    }
    //Titulos de las secciones
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerframe = tableView.frame
        let title : UILabel = UILabel()
        
        title.frame = CGRect(x: 15, y: 16, width: headerframe.size.width, height: 25)
        title.text = "Elige tu sushi"
        title.textColor = .black
        title.font = UIFont(name: "Helvetica-Bold", size: 21.0)
        
        let headerView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: headerframe.size.width, height: headerframe.size.height))
        
        headerView.addSubview(title)
        
        return headerView
    }
    //Altura del seccion header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    //Numero de secciones
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = orderTableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! orderTableViewCell
        
        cell.selectionStyle = .none
        cell.itemName.text = data[indexPath.section][indexPath.row]
        
        return cell
    }
    
    
}
