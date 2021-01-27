//
//  LocationTableViewCell.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 22/01/21.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    @IBOutlet weak var pinIcon: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
