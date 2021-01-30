//
//  FoodTableViewCell.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 10/01/21.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceFoodLabel: UILabel!
    @IBOutlet weak var nameFoodLabel: UILabel!
    @IBOutlet weak var foodImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
