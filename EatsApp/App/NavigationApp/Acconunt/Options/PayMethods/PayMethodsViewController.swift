//
//  PayMethodsViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 21/01/21.
//

import UIKit

class PayMethodsViewController: UIViewController, UITableViewDataSource, UITabBarDelegate{
    
    @IBOutlet weak var paymentsTableView: UITableView!
    
    let methodsPayNames = [
        "Efectivo",
        "Paypal",
        "Tarjeta de Credito/Debito"
    ]
    let methodsPayIcons = [
        "dollarsign.circle.fill",
        "dollarsign.square.fill",
        "creditcard.fill"
    ]
    
    //MARK: - TableView Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return methodsPayNames.count
    }
    //MARK: - TableView DataSorce
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = paymentsTableView.dequeueReusableCell(withIdentifier: "methodpay", for: indexPath) as! PaymentMethodTableViewCell
        
        cell.payMethodLabel.text = methodsPayNames[indexPath.row]
        cell.payMethodImageView.image = UIImage(systemName: methodsPayIcons[indexPath.row])
        
        return cell
    }
    
    //MARK:- VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let header = UIView(frame: CGRect(x: 0, y: 10, width: self.view.frame.width, height: 40.0))
        
        let titleStoryeboard = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 25))
        titleStoryeboard.text = "Metodos de pago"
        titleStoryeboard.textAlignment = .center
        titleStoryeboard.tintColor = .black
        titleStoryeboard.font = UIFont(name: "Helvetica-Bold", size: 21)
        titleStoryeboard.center = header.center
        
        header.addSubview(titleStoryeboard)
        
        paymentsTableView.tableHeaderView = header
        
    }
}
