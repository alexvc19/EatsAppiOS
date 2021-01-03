//
//  LastOrdersViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 02/01/21.
//

import UIKit

class LastOrdersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var lastOrdersTableView: UITableView!
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 50
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 10 // Espacio que deseas tener.
//    }
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
