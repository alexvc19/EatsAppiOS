//
//  HeaderAccount.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 20/01/21.
//

import UIKit

class HeaderAccount: UIView {
    

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
    
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
        
    }
}
