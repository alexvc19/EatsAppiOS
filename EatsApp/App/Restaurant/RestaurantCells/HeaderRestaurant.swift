//
//  HeaderRestaurant.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 09/01/21.
//

import UIKit

class HeaderRestaurant: UIView {

    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("HeaderRestaurant", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
    }

}
