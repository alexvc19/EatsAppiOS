//
//  orderTableViewCell.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 01/02/21.
//

import UIKit

class orderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)
           //self.accessoryType = selected ? .checkmark : .none
        
          
       }

}
