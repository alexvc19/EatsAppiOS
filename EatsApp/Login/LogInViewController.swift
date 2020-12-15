//
//  LogInViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 10/12/20.
//

import UIKit
import FlagPhoneNumber

class LogInViewController: UIViewController {

    @IBOutlet weak var phoneNumberTextField: FPNTextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var create: UIButton!
    
    
    
    var listController: FPNCountryListViewController = FPNCountryListViewController(style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //color del borde
        let myColor = UIColor(named: "GrisClaro")
        
        //MARK: - Configuracion del phoneNumberTextField
        phoneNumberTextField.delegate = self
        phoneNumberTextField.setFlag(countryCode: .MX)
        phoneNumberTextField.hasPhoneNumberExample = true
        phoneNumberTextField.placeholder = "Phone Number"

        
        // MARK: - Aspecto de botones y textfields bordes, color de bordes y radio
        //radio a los bordes
        pass.layer.cornerRadius = 5
        create.layer.cornerRadius = 15
        
        pass.layer.borderColor = myColor?.cgColor
        
        //tamaño del borde
        pass.layer.borderWidth = 0.5
        googleButton.layer.borderWidth = 1.0
        create.layer.borderWidth = 1.0
        
        // MARK: - Icono de boton google
        let icon = UIImage(named: "Google")!
        googleButton.setImage(icon, for: .normal)
        googleButton.imageView!.contentMode = .scaleAspectFill
        googleButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        
        //MARK: - Cerrar el keyboard
        let tapGesture = UITapGestureRecognizer(target: self, action:     #selector(tapGestureHandler))
              view.addGestureRecognizer(tapGesture)
        
    }
    //MARK: - Funcion para cerrar el keyboard
    @objc func tapGestureHandler() {
        //phone.endEditing(true)
        pass.endEditing(true)
        phoneNumberTextField.endEditing(true)
      }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    //funcion del phoneNumberTextField
    private func getCustomTextFieldInputAccessoryView(with items: [UIBarButtonItem]) -> UIToolbar {
        let toolbar: UIToolbar = UIToolbar()

        toolbar.barStyle = UIBarStyle.default
        toolbar.items = items
        toolbar.sizeToFit()

        return toolbar
    }

    @objc func dismissCountries() {
        listController.dismiss(animated: true, completion: nil)
    }
}

//MARK: - Extension del delegado phoneNumberTextField
extension LogInViewController: FPNTextFieldDelegate {

    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        textField.rightViewMode = .always
        textField.rightView = UIImageView(image: isValid ? #imageLiteral(resourceName: "success") : #imageLiteral(resourceName: "error"))

        print(
            isValid,
            textField.getFormattedPhoneNumber(format: .E164) ?? "E164: nil",
            textField.getFormattedPhoneNumber(format: .International) ?? "International: nil",
            textField.getFormattedPhoneNumber(format: .National) ?? "National: nil",
            textField.getFormattedPhoneNumber(format: .RFC3966) ?? "RFC3966: nil",
            textField.getRawPhoneNumber() ?? "Raw: nil"
        )
    }

    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        print(name, dialCode, code)
    }


    func fpnDisplayCountryList() {
        let navigationViewController = UINavigationController(rootViewController: listController)

        listController.title = "Countries"
        listController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(dismissCountries))

        self.present(navigationViewController, animated: true, completion: nil)
    }
}

