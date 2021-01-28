//
//  RestaurantsTableViewCell.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 27/01/21.
//

import UIKit

struct Menu {
    var name: String
    var price: String
}

class RestaurantsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var deliveryCost: UILabel!
    @IBOutlet weak var estimateTimeLabel: UILabel!
    
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var menuCardCollectionView:UICollectionView!
    
    var cellNib = "cardMenuCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        menuCardCollectionView.register(UINib(nibName: "CardMenuCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellNib)
        self.menuCardCollectionView.dataSource = self
        self.menuCardCollectionView.delegate = self
        
        //Shadow card
        cardView.backgroundColor = .clear
        cardView.layer.masksToBounds = false
        cardView.layer.shadowOpacity = 0.22
        cardView.layer.shadowRadius = 3
        cardView.layer.shadowOffset = CGSize(width: 0, height: 5)
        cardView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        cardView.backgroundColor = UIColor.white
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
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

extension UIImageView {
    public func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
}
