//
//  RegisterViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 24/12/20.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var nameTexfield: UITextField!
    @IBOutlet weak var phoneTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerButton(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTexfield.layer.borderWidth = 0.5
        nameTexfield.layer.borderColor = UIColor(named: "Amarillo")?.cgColor
        nameTexfield.layer.cornerRadius = 5
        
        phoneTextfield.layer.borderWidth = 0.5
        phoneTextfield.layer.borderColor = UIColor(named: "Amarillo")?.cgColor
        phoneTextfield.layer.cornerRadius = 5
        
        emailTextfield.layer.borderWidth = 0.5
        emailTextfield.layer.borderColor = UIColor(named: "Amarillo")?.cgColor
        emailTextfield.layer.cornerRadius = 5
        
        passwordTextfield.layer.borderWidth = 0.5
        passwordTextfield.layer.borderColor = UIColor(named: "Amarillo")?.cgColor
        passwordTextfield.layer.cornerRadius = 5
        
        let tapGesture = UITapGestureRecognizer(target: self, action:     #selector(tapGestureHandler))
            view.addGestureRecognizer(tapGesture)

    }
    
    @objc func tapGestureHandler() {
        nameTexfield.endEditing(true)
        phoneTextfield.endEditing(true)
        emailTextfield.endEditing(true)
        passwordTextfield.endEditing(true)
      }
    
}
