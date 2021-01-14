//
//  MainViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 11/12/20.
//

import UIKit
import FirebaseFirestore
import FirebaseUI
import FirebaseFirestoreSwift

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var pageView: UIPageControl!
    @IBOutlet weak var tableView: UITableView!
    
    let db = Firestore.firestore()
    //variable del timer
    var timer: Timer?
    //variable del PageControl
    var currentcellindex = 0
    
    //fotos card "mas popular"
    var secciones:[String] = [
        "Mas popular",
        "Tus Favoritos",
        "Ofertas de hoy"
    ]
    //card nombre de la comida
    var namesOfFood:[String]=[
        "Pollo Frito",
        "Sushi"
    ]
    
    var photos = [Photos]()
    var users = [User]()
    var photosCategories = [PhotosCategories]()
    
    //MARK: TABLEVIEW
    //MARK: - TableView Delegate
    // Sections Title
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerframe = tableView.frame
        let title : UILabel = UILabel()
        
        title.frame = CGRect(x: 20, y: 20, width: headerframe.size.width, height: 20)
        title.text = secciones[section]
        title.textColor = UIColor.black
        title.font = UIFont(name: "Helvetica-Bold", size: 21.0)
        
        let headerView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: headerframe.size.width, height: headerframe.size.height))
        
        headerView.addSubview(title)
        
        return headerView
    }
    //Altura del seccion header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55.0
    }
    //Numero de secciones
    func numberOfSections(in tableView: UITableView) -> Int {
        return secciones.count
    }
    //Numero de celdas en cada seccion
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    //MARK: - TableView DataSorce
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: "cellCard", for: indexPath) as! CardCollectionTableViewCell
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    //MARK: -  ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Header TableView
        let header = HeaderHome(frame: CGRect(x: 0, y: 0, width:view.frame.width, height: 320))
        
        tableView.tableHeaderView = header
        
        // Cerrar el keyboard
        let tapGesture = UITapGestureRecognizer(target: self, action:     #selector(tapGestureHandler))
            view.addGestureRecognizer(tapGesture)
        
        tableView.register(UINib(nibName: "CardCollectionTableViewCell", bundle: nil), forCellReuseIdentifier: "cellCard")
    
    }
    //MARK: - Funcion para cerrar el keyboard
    @objc func tapGestureHandler() {
//        ubicationTextF.endEditing(true)
       
      }
}
