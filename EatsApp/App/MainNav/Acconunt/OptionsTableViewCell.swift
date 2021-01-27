//
//  OptionsTableViewCell.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 21/01/21.
//

import UIKit

class OptionsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var optionIconImageView: UIImageView!
    @IBOutlet weak var optionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
