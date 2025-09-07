//
//  LogInViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 10/12/20.
//
import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var create: UIButton!
    
    @IBAction func RegisterButton(_ sender: Any) {
        
    }
    @IBAction func signUpButtonAction(_ sender: Any) {
        _ = pass.text
    
    }

    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    // Show the Navigation Bar
    self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(true)
    // Hide the Navigation Bar
    self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pass.layer.cornerRadius = 5
        pass.layer.borderColor = UIColor(named: "Amarillo")?.cgColor
        pass.layer.borderWidth = 0.5
        
        //botones
        googleButton.layer.borderWidth = 1.0
        create.layer.borderWidth = 1.0
        create.layer.cornerRadius = 15
        
        //Icono de boton google
        let icon = UIImage(named: "Google")!
        googleButton.setImage(icon, for: .normal)
        googleButton.imageView!.contentMode = .scaleAspectFill
        //googleButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        
        //MARK: - Cerrar el keyboard
        let tapGesture = UITapGestureRecognizer(target: self, action:     #selector(tapGestureHandler))
              view.addGestureRecognizer(tapGesture)
        
    }
    //MARK: - Funcion para cerrar el keyboard
    @objc func tapGestureHandler() {
        //phone.endEditing(true)
        pass.endEditing(true)
      }
    
    //funcion del phoneNumberTextField
    private func getCustomTextFieldInputAccessoryView(with items: [UIBarButtonItem]) -> UIToolbar {
        let toolbar: UIToolbar = UIToolbar()

        toolbar.barStyle = UIBarStyle.default
        toolbar.items = items
        toolbar.sizeToFit()

        return toolbar
    }

    @objc func dismissCountries() {
    }
    
}

