//
//  InfoPersonalViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 21/01/21.
//

import UIKit

class InfoPersonalViewController: UIViewController {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userPointsLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var phoneNumberTextfield: UITextField!
    @IBOutlet weak var actualPasswordTextfield: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmNewPasswordTextfield: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TextFields
        nameTextField.layer.borderWidth = 0.5
        nameTextField.layer.borderColor = UIColor(named: "Amarillo")?.cgColor
        nameTextField.layer.cornerRadius = 5
        
        lastNameTextField.layer.borderWidth = 0.5
        lastNameTextField.layer.borderColor = UIColor(named: "Amarillo")?.cgColor
        lastNameTextField.layer.cornerRadius = 5
        
        emailTextfield.layer.borderWidth = 0.5
        emailTextfield.layer.borderColor = UIColor(named: "Amarillo")?.cgColor
        emailTextfield.layer.cornerRadius = 5
        
        
        phoneNumberTextfield.layer.borderWidth = 0.5
        phoneNumberTextfield.layer.borderColor = UIColor(named: "Amarillo")?.cgColor
        phoneNumberTextfield.layer.cornerRadius = 5
        
        actualPasswordTextfield.layer.borderWidth = 0.5
        actualPasswordTextfield.layer.borderColor = UIColor(named: "Amarillo")?.cgColor
        actualPasswordTextfield.layer.cornerRadius = 5
        
        newPasswordTextField.layer.borderWidth = 0.5
        newPasswordTextField.layer.borderColor = UIColor(named: "Amarillo")?.cgColor
        newPasswordTextField.layer.cornerRadius = 5
        
        confirmNewPasswordTextfield.layer.borderWidth = 0.5
        confirmNewPasswordTextfield.layer.borderColor = UIColor(named: "Amarillo")?.cgColor
        confirmNewPasswordTextfield.layer.cornerRadius = 5
        
        //ImageView
        userImageView.layer.cornerRadius = (userImageView.frame.size.width ) / 2
        userImageView.clipsToBounds = true
        userImageView.layer.borderWidth = 1.0
        userImageView.layer.borderColor = UIColor(named: "Rojo")?.cgColor
        
        // Cerrar el keyboard
        let tapGesture = UITapGestureRecognizer(target: self, action:     #selector(tapGestureHandler))
        view.addGestureRecognizer(tapGesture)
        
    }
    //MARK: - Funcion para cerrar el keyboard
    @objc func tapGestureHandler() {
        nameTextField.endEditing(true)
        lastNameTextField.endEditing(true)
        emailTextfield.endEditing(true)
        phoneNumberTextfield.endEditing(true)
        actualPasswordTextfield.endEditing(true)
        newPasswordTextField.endEditing(true)
        confirmNewPasswordTextfield.endEditing(true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerNotifications()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        scrollView.contentInset.bottom = 0
    }
    
    private func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification){
        guard let keyboardFrame = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        scrollView.contentInset.bottom = view.convert(keyboardFrame.cgRectValue, from: nil).size.height
    }
    
    @objc private func keyboardWillHide(notification: NSNotification){
        scrollView.contentInset.bottom = 0
    }
    
}
