//
//  MenuCollectionViewCell.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 27/01/21.
//

import UIKit

class CardMenuCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var menuPhotoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //corners
        self.contentView.layer.cornerRadius = 5.0
        self.contentView.layer.borderWidth = 0.5
        self.contentView.layer.borderColor = UIColor.white.cgColor
        self.contentView.layer.masksToBounds = true
        
        //shadows
        self.backgroundColor = .clear
        self.layer.masksToBounds = false
        self.layer.shadowOpacity = 0.22
        self.layer.shadowRadius = 3
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        self.contentView.backgroundColor = .white
        self.contentView.layer.cornerRadius = 5
        
    }

}
