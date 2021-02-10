//
//  ItemTableViewCell.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 10/02/21.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var numOfItems: UILabel!
    @IBOutlet weak var nameItem: UILabel!
    @IBOutlet weak var priceItem: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        numOfItems.text = "0"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
