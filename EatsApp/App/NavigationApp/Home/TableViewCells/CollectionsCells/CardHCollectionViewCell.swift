//
//  CardHCollectionViewCell.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 12/01/21.
//

import UIKit

class CardHCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photoImageView:UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var priceDelivery: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
