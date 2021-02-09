//
//  ItemView.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 08/02/21.
//

import UIKit

class ItemView: UIView {

    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("ItemView", owner: self, options: nil)![0] as! UIView
        //viewFromXib.frame = self.bounds
//        viewFromXib.frame = CGRect(x: 0, y: 0, width: 374, height: 51)
        addSubview(viewFromXib)
        
    }
}
