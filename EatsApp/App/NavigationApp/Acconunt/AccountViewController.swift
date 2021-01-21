//
//  AccountViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 02/01/21.
//

import UIKit

class AccountViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var accountTableView: UITableView!
    
    let icons = [
        "person.crop.rectangle.fill",
        "creditcard.fill",
        "mappin.circle.fill",
        "questionmark",
        "arrow.right"
    ]
    
    let optionsNames = [
        "Informacion personal",
        "Formas de pago",
        "Direcciones",
        "Ayuda",
        "Cerrar sesion"
    ]
    
    //MARK: - TableView
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedOption = self.optionsNames[indexPath.row]
        print(selectedOption)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = accountTableView.dequeueReusableCell(withIdentifier: "optionscell", for: indexPath) as! OptionsTableViewCell
        
        cell.optionIconImageView.image = UIImage(systemName: icons[indexPath.row])
        cell.optionLabel.text = optionsNames[indexPath.row]
        
        return cell
    }
    
    @objc func buttonAction(sender: UIButton!) {
        
    let vc = UIStoryboard.init(name: "TermsViewController", bundle: Bundle.main).instantiateViewController(withIdentifier: "TermsViewController")
    self.navigationController?.showDetailViewController(vc, sender: nil)
      print("Button tapped")
    }
    
    //MARK: - VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - Header
        let header = HeaderAccount(frame: CGRect(x: 0, y: 0, width:view.frame.width, height: 207))
        
        accountTableView.tableHeaderView = header
        
        //MARK: - Footer
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 45.0))
        
        //terms and conditions button
        let boton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        boton.setTitle("Terminos y condiciones", for: .normal)
        boton.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
        boton.setTitleColor(UIColor(named: "Rojo"),for: .normal)
        boton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        boton.center = footer.center
        footer.addSubview(boton)
        
        footer.layer.backgroundColor = UIColor(named: "GrisClaro")?.cgColor
        accountTableView.tableFooterView = footer
       
    }
}


