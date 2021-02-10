//
//  LastOrdersViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 02/01/21.
//

import UIKit

class LastOrdersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let storyBoardId = "Ticket"
    
    @IBOutlet weak var lastOrdersTableView: UITableView!

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: storyBoardId, bundle: Bundle.main).instantiateViewController(withIdentifier: storyBoardId)
        self.navigationController?.show(vc, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = lastOrdersTableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! LastOrdesTableViewCell
        
        cell.photoImageView.image = UIImage(named: "Logotype")
        cell.nameLabel.text = "Restaurante"
        cell.itemsLabel.text = "2 articulos"
        cell.dateLabel.text = "24 de dic del 2020"
        return cell
    }
   

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
