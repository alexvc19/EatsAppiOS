//
//  AccountViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 02/01/21.
//

import UIKit

class AccountViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var accountTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = accountTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "test"
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let header = HeaderAccount(frame: CGRect(x: 0, y: 0, width:view.frame.width, height: 207))
        
        accountTableView.tableHeaderView = header
       
    }
}


