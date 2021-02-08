//
//  TicketViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 05/02/21.
//

import UIKit

class TicketViewController: UIViewController {
    
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var starsStack: UIStackView!
    
    @IBOutlet weak var star1: UIButton!
    @IBOutlet weak var star2: UIButton!
    @IBOutlet weak var star3: UIButton!
    @IBOutlet weak var star4: UIButton!
    @IBOutlet weak var star5: UIButton!
    
    @IBOutlet weak var textField: UITextView!
    
    let starIcon = "star.fill"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        helpButton.layer.borderWidth = 0.5
        helpButton.layer.borderColor = UIColor(named: "Rojo")?.cgColor
        helpButton.layer.cornerRadius = 10
        
        textField.layer.borderColor = UIColor(named: "Amarillo")?.cgColor
        textField.layer.borderWidth = 0.5
        
    }
    
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
}
