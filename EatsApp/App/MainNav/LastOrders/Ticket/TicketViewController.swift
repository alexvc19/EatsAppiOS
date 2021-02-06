//
//  TicketViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 05/02/21.
//

import UIKit

class TicketViewController: UIViewController {
    
    @IBOutlet weak var helpButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        helpButton.layer.borderWidth = 0.5
        helpButton.layer.borderColor = UIColor(named: "Rojo")?.cgColor
        helpButton.layer.cornerRadius = 10
    }
    
}
