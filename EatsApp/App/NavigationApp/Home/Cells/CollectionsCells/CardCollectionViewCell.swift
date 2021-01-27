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
    @IBOutlet weak var estimateTime: UILabel!
    
    @IBOutlet weak var stackView: UIStackView!
    
    let star = "star.fill"
    let borderStart = "star"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let iv1 = UIImageView(image: UIImage(systemName: star))
        let iv2 = UIImageView(image: UIImage(systemName: star))
        let iv3 = UIImageView(image: UIImage(systemName: star))
        let iv4 = UIImageView(image: UIImage(systemName: star))
        let iv5 = UIImageView(image: UIImage(systemName: borderStart))
        
        iv1.tintColor = UIColor(named: "AmarilloClaro")
        iv2.tintColor = UIColor(named: "AmarilloClaro")
        iv3.tintColor = UIColor(named: "AmarilloClaro")
        iv4.tintColor = UIColor(named: "AmarilloClaro")
        iv5.tintColor = UIColor(named: "AmarilloClaro")
        
        stackView.addArrangedSubview(iv1)
        stackView.addArrangedSubview(iv2)
        stackView.addArrangedSubview(iv3)
        stackView.addArrangedSubview(iv4)
        stackView.addArrangedSubview(iv5)
        
//        let viewXib = Bundle.main.loadNibNamed("card", owner: self, options: nil)![0] as! UIView
//
//        viewXib.layer.borderWidth = 0.5
//        viewXib.layer.borderColor = UIColor(named: "Gris")?.cgColor
//        viewXib.frame = self.bounds
//        addSubview(viewXib)
        
    }

}
