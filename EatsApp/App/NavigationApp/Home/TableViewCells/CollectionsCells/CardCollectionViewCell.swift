//
//  CardHCollectionViewCell.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 12/01/21.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photoImageView:UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var priceDelivery: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        let viewXib = Bundle.main.loadNibNamed("card", owner: self, options: nil)![0] as! UIView
//
//        viewXib.layer.borderWidth = 0.5
//        viewXib.layer.borderColor = UIColor(named: "Gris")?.cgColor
//        viewXib.frame = self.bounds
//        addSubview(viewXib)
        
    }

}
