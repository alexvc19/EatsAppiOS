//
//  TicketViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 05/02/21.
//

import UIKit

class TicketViewController: UIViewController {
    
    @IBOutlet weak var ticketTableVIew:UITableView!
    
    var items = [
        "peach",
        "apple",
        "orage",
        "grapes"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ticketTableVIew.dataSource = self
        self.ticketTableVIew.delegate = self
        
        
        let tableHeader = TicketHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 462.0))
        
        let tableFooter = TicketFooderView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 301.0))
        
        ticketTableVIew.tableHeaderView = tableHeader
        ticketTableVIew.tableFooterView = tableFooter
        
    }
   
}
extension TicketViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = ticketTableVIew.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ItemTableViewCell else {
            fatalError()
        }
        cell.nameItem.text = items[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}
