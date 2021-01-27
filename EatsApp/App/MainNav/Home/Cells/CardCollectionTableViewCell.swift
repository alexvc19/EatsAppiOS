//
//  CardCollectionHTableViewCell.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 12/01/21.
//

import UIKit

class CardCollectionTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    

    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    var waitTime = "30 - 40 minutos"
    
    var restaurantID = "Restaurant"
        
    let objViewController = UIApplication.topViewController()!
    
    //MARK: - Init view
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardCollectionView.register(UINib(nibName: "CardViewCell", bundle: nil), forCellWithReuseIdentifier: "card")
        cardCollectionView.dataSource = self
        cardCollectionView.delegate = self
    }

    //MARK:- CollectionView delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: restaurantID, bundle: Bundle.main).instantiateViewController(withIdentifier: restaurantID)
        objViewController.navigationController?.show(vc, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    //MARK:- CollectionView DataSource
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = cardCollectionView.dequeueReusableCell(withReuseIdentifier: "card", for: indexPath) as! CardViewCell
        
        cell.priceDelivery.text = "$79.00"
        cell.name.text = "FOOD"
        cell.estimateTime.text = waitTime
        
        cell.layer.borderColor = UIColor(named: "GrisClaro")?.cgColor
        cell.layer.borderWidth = 1
        //shadows
        cell.backgroundColor = .clear
        cell.layer.masksToBounds = false
        cell.layer.shadowOpacity = 0.22
        cell.layer.shadowRadius = 3
        cell.layer.shadowOffset = CGSize(width: 0, height: 5)
        cell.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        cell.contentView.backgroundColor = .white
        cell.contentView.layer.cornerRadius = 0
        
        return cell
    }

}
//Usando el siguiente código puede obtener el controlador de vista superior y usando ese controlador de vista puede realizar su operación de empuje
extension UIApplication {
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}
