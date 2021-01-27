//
//  HeaderAccount.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 20/01/21.
//

import UIKit

class HeaderAccount: UIView {
        
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userPoitsLabel: UILabel!

    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("HeaderAccount", owner: self, options: nil)![0] as! UIView
 
        userImageView.image = UIImage(named: "default")
        userImageView.layer.cornerRadius = (userImageView.frame.size.width ) / 2
        userImageView.clipsToBounds = true
        userImageView.layer.borderWidth = 1.0
        userImageView.layer.borderColor = UIColor(named: "Rojo")?.cgColor
        
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
        
    }
}
