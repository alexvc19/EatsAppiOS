//
//  RestaurantsTableViewCell.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 27/01/21.
//

import UIKit

class RestaurantsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var deliveryCost: UILabel!
    @IBOutlet weak var estimateTimeLabel: UILabel!
    
    @IBOutlet weak var menuCardCollectionView:UICollectionView!
    
    var cellNib = "cardMenuCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        menuCardCollectionView.register(UINib(nibName: "CardMenuCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellNib)
        self.menuCardCollectionView.dataSource = self
        self.menuCardCollectionView.delegate = self
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
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
