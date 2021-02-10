//
//  StarsView.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 10/02/21.
//

import UIKit

@IBDesignable
class StarsView: UIView {
    @IBOutlet weak var star1: UIButton!
    @IBOutlet weak var star2: UIButton!
    @IBOutlet weak var star3: UIButton!
    @IBOutlet weak var star4: UIButton!
    @IBOutlet weak var star5: UIButton!
    
    let starIcon = "star.fill"
    
    @IBAction func pressStar1(_ sender: Any) {
        star1.setImage(UIImage(systemName: starIcon), for: .normal)
        star2.setImage(UIImage(systemName: "star"), for: .normal)
        star3.setImage(UIImage(systemName: "star"), for: .normal)
        star4.setImage(UIImage(systemName: "star"), for: .normal)
        star5.setImage(UIImage(systemName: "star"), for: .normal)
    }
    @IBAction func pressStar2(_ sender: Any) {
        star1.setImage(UIImage(systemName: starIcon), for: .normal)
        star2.setImage(UIImage(systemName: starIcon), for: .normal)
        star3.setImage(UIImage(systemName: "star"), for: .normal)
        star4.setImage(UIImage(systemName: "star"), for: .normal)
        star5.setImage(UIImage(systemName: "star"), for: .normal)
        
    }
    @IBAction func pressStar3(_ sender: Any) {
        star1.setImage(UIImage(systemName: starIcon), for: .normal)
        star2.setImage(UIImage(systemName: starIcon), for: .normal)
        star3.setImage(UIImage(systemName: starIcon), for: .normal)
        star4.setImage(UIImage(systemName: "star"), for: .normal)
        star5.setImage(UIImage(systemName: "star"), for: .normal)
    }
    @IBAction func pressStar4(_ sender: Any) {
        star1.setImage(UIImage(systemName: starIcon), for: .normal)
        star2.setImage(UIImage(systemName: starIcon), for: .normal)
        star3.setImage(UIImage(systemName: starIcon), for: .normal)
        star4.setImage(UIImage(systemName: starIcon), for: .normal)
        star5.setImage(UIImage(systemName: "star"), for: .normal)
    }
    @IBAction func pressStar5(_ sender: Any) {
        star1.setImage(UIImage(systemName: starIcon), for: .normal)
        star2.setImage(UIImage(systemName: starIcon), for: .normal)
        star3.setImage(UIImage(systemName: starIcon), for: .normal)
        star4.setImage(UIImage(systemName: starIcon), for: .normal)
        star5.setImage(UIImage(systemName: starIcon), for: .normal)
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("StarsView", owner: self, options: nil)![0] as! UIView
    
        
        addSubview(viewFromXib)
       
    }
}
