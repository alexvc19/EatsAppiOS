//
//  CardUIView.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 24/12/20.
//

import UIKit

class CardView: UIView {
    
    @IBOutlet weak var names: UILabel!
    @IBOutlet weak var waitTime: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("CardView", owner: self, options: nil)![0] as! UIView
        viewFromXib.layer.borderWidth = 0.5
        viewFromXib.layer.borderColor = UIColor(named: "Gris")?.cgColor
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
    }
}
