//
//  TicketFooderView.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 10/02/21.
//

import UIKit

class TicketFooderView: UIView {

   
    
    @IBOutlet weak var textField: UITextView!
    
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var starsStack: UIStackView! 
        
    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("TicketFooderView", owner: self, options: nil)![0] as! UIView
        
        textField.layer.borderColor = UIColor(named: "Amarillo")?.cgColor
        textField.layer.borderWidth = 0.5
        
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
       
    }
    

}
