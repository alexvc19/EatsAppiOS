//
//  LogInViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 10/12/20.
//

import UIKit
import FlagPhoneNumber
import FirebaseFirestore
import FirebaseUI
import FirebaseFirestoreSwift
import FirebaseStorage

class LogInViewController: UIViewController {

    @IBOutlet weak var phoneNumberTextField: FPNTextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var create: UIButton!
    
    
    
    var listController: FPNCountryListViewController = FPNCountryListViewController(style: .grouped)
    
    let db = Firestore.firestore()
    
    @IBAction func RegisterButton(_ sender: Any) {
        
    }
    @IBAction func signUpButtonAction(_ sender: Any) {
        
        let phone = phoneNumberTextField.text
        let password = pass.text
        
        //Consulta de la base de datos cloudFirestore
        db.collection("users")
            .whereField("phone", isEqualTo: phone as Any)
            .whereField("password", isEqualTo: password as Any)
            .getDocuments() { (querySnapshot, err) in
            if let querySnapshot = querySnapshot {
            
                for document in querySnapshot.documents {
                    
                    print("\(document.documentID) => \(document.data())")
                    
                   let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "Main")
                    self.navigationController?.show(vc, sender: nil)

                }
                
                //valida que existen los datos
                if (querySnapshot.isEmpty == true) {
                    
                    let alertController = UIAlertController(title: "Error", message: "El numero de telefono o la contraseña no son validos", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alertController, animated: true, completion: nil)
                }

            } else{
                
                print("Error getting documents:")
            
            }
                // valida que los textfields no esten vacios
                if((phone == "") && password == ""){
                    print("No hay numero ni contraseña en el textfield")
                    
                    let alertController = UIAlertController(title: "Error", message: "El numero de telefono o la contraseña no son validos", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                }
        }
        
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

        //MARK: - Configuracion del phoneNumberTextField
        phoneNumberTextField.delegate = self
        phoneNumberTextField.setFlag(countryCode: .MX)
        phoneNumberTextField.hasPhoneNumberExample = true
        phoneNumberTextField.placeholder = "Phone Number"

        
        // MARK: - Aspecto de botones y textfields
       
        //textfields
        phoneNumberTextField.layer.borderWidth = 0.5
        phoneNumberTextField.layer.borderColor = UIColor(named: "Amarillo")?.cgColor
        phoneNumberTextField.layer.cornerRadius = 5
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

