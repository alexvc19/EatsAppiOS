//
//  PaymentMethodTableViewCell.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 21/01/21.
//

import UIKit

class PaymentMethodTableViewCell: UITableViewCell {
    
    @IBOutlet weak var payMethodImageView: UIImageView!
    @IBOutlet weak var payMethodLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        payMethodImageView.image = UIImage(named: "Logotype")
        payMethodLabel.text = "Method pay"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
