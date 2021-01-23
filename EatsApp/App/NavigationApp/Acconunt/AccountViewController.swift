//
//  AccountViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 02/01/21.
//

import UIKit

struct Options {
    var name: String
    var icon: String
}

class AccountViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var accountTableView: UITableView!
    
    let options = [
        Options(name: "Informacion personal", icon:  "person.crop.rectangle.fill"),
        Options(name:"Formas de pago", icon: "creditcard.fill"),
        Options(name:"Direcciones", icon: "mappin.circle.fill"),
        Options(name: "Ayuda", icon:"questionmark"),
        Options(name: "Cerrar sesion", icon: "arrow.right"),
        
    ]
    
    let storyBoardName = [
        "InfoPersonal",
        "PayMethods",
        "Locations",
        "Help",
        "Close",
    ]
    
    //MARK: - TableView
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        accountTableView.deselectRow(at: indexPath, animated: false)
        
        let selectedOption = self.storyBoardName[indexPath.row]
        
        switch  selectedOption{
        case storyBoardName[0]:
            let vc = UIStoryboard.init(name: selectedOption, bundle: Bundle.main).instantiateViewController(withIdentifier: selectedOption)
            self.navigationController?.show(vc, sender: nil)
            
        case storyBoardName[1]:
            let vc = UIStoryboard.init(name: selectedOption, bundle: Bundle.main).instantiateViewController(withIdentifier: selectedOption)
            self.navigationController?.show(vc, sender: nil)
            
        case storyBoardName[2]:
            let vc = UIStoryboard.init(name: selectedOption, bundle: Bundle.main).instantiateViewController(withIdentifier: selectedOption)
            self.navigationController?.show(vc, sender: nil)
            
        case storyBoardName[3]:
            let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        case storyBoardName[4]:
            let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        default:
            print("No fount")
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    //MARK: DataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = accountTableView.dequeueReusableCell(withIdentifier: "optionscell") as! OptionsTableViewCell? else {
            fatalError()
        }
        let iconColor = UIImage(systemName: options[indexPath.row].icon)
        
        cell.optionIconImageView.tintColor = .black
        cell.optionIconImageView.image = iconColor
        cell.optionLabel.text = options[indexPath.row].name
        
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
        
        accountTableView.tableFooterView = footer
        
    }
}

