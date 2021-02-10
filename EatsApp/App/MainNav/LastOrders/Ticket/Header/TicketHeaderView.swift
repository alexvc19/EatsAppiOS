//
//  TicketHeaderView.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 10/02/21.
//

import UIKit

class TicketHeaderView: UIView {
    
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var starsStack: UIStackView!
    let starIcon = "star.fill"
    
    
    
    //MARK:- Init view
    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("TicketHeaderView", owner: self, options: nil)![0] as! UIView
        
        helpButton.layer.borderWidth = 0.5
        helpButton.layer.borderColor = UIColor(named: "Rojo")?.cgColor
        helpButton.layer.cornerRadius = 10
        
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)

    }

}
