//
//  OptionsView.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 02/01/21.
//

import UIKit

class OptionsView: UIView {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var optionLabel: UILabel!

    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("OptionsView", owner: self, options: nil)![0] as! UIView
        
        addSubview(viewFromXib)
    }

}
