//
//  CardCollectionHTableViewCell.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 12/01/21.
//

import UIKit

class CardCollectionHTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    

    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardCollectionView.register(UINib(nibName: "CardHCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "card")
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
       let cell = cardCollectionView.dequeueReusableCell(withReuseIdentifier: "card", for: indexPath) as! CardHCollectionViewCell
        
        cell.name.text = "test"
        
        return cell
    }
    
}
