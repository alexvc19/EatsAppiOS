//
//  CategoriesViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 27/01/21.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    @IBOutlet weak var categoriesTableView: UITableView!
    
    var cellNib = "restaurantCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Header TableView
        let header = CategoriesHeaderView(frame: CGRect(x: 0, y: 0, width:view.frame.width, height: 350))
        
        categoriesTableView.register(UINib(nibName: "RestaurantsTableViewCell", bundle: nil), forCellReuseIdentifier: cellNib)
        
        categoriesTableView.tableHeaderView = header
        self.categoriesTableView.dataSource = self
        self.categoriesTableView.delegate = self
        
    }
    
}
//MARK: - Restaurant Card Cell
extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 297
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = categoriesTableView.dequeueReusableCell(withIdentifier: cellNib, for: indexPath) as? RestaurantsTableViewCell else {
            fatalError()
        }
        DispatchQueue.main.async {
            cell.photoImageView.roundCorners([.topLeft, .topRight], radius: 5)
        }
        cell.selectionStyle = .none
        cell.restaurantNameLabel?.text = "name"
        cell.estimateTimeLabel?.text = "30 - 40 minutos"
        cell.deliveryCost?.text = "$30"
        cell.photoImageView.image = UIImage(named: "pedido")
        
        return cell
    }
    
}
//MARK: - Collection Restaurant Card
extension RestaurantsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = menuCardCollectionView.dequeueReusableCell(withReuseIdentifier: cellNib, for: indexPath) as? CardMenuCollectionViewCell else {
            fatalError()
        }
        
        return cell
    }
}
