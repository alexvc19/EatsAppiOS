//
//  HelpViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 23/01/21.
//

import UIKit

class HelpViewController: UIViewController {

    @IBOutlet weak var issueTextField: UITextField!
    @IBOutlet weak var problemTextView: UITextView!
    
    @IBOutlet weak var contactSegmentC: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        issueTextField?.layer.borderWidth = 0.5
        issueTextField?.layer.borderColor = UIColor(named: "Amarillo")?.cgColor
        issueTextField?.layer.cornerRadius = 5
        
        problemTextView?.layer.borderWidth = 0.5
        problemTextView?.layer.borderColor = UIColor(named: "Amarillo")?.cgColor
        problemTextView?.layer.cornerRadius = 5
        
        let tapGesture = UITapGestureRecognizer(target: self, action:     #selector(tapGestureHandler))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func tapGestureHandler() {
        issueTextField.endEditing(true)
        problemTextView.endEditing(true)
    }
}
