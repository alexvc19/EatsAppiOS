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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardCollectionView.register(UINib(nibName: "CardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "card")
        cardCollectionView.dataSource = self
        cardCollectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = cardCollectionView.dequeueReusableCell(withReuseIdentifier: "card", for: indexPath) as! CardCollectionViewCell
        
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
