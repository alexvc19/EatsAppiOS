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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let header = UIView(frame: CGRect(x: 0.0, y: 0.0, width: view.frame.size.width, height: 200.0))
        header.backgroundColor = .cyan
        
        orderTableview.tableHeaderView = header
    }
    
}
extension OrderViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = orderTableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
        return cell
    }
    
    
}
