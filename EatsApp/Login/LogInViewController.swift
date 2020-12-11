//
//  LogInViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 10/12/20.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var create: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: - Aspecto de botones y textfields bordes, color de bordes y radio
        
        //radio a los bordes
        phone.layer.cornerRadius = 5
        pass.layer.cornerRadius = 5
        create.layer.cornerRadius = 15
        
        //color del borde
        let myColor = UIColor(named: "Amarillo")
        phone.layer.borderColor = myColor?.cgColor
        pass.layer.borderColor = myColor?.cgColor
        
        //tamaño del borde
        phone.layer.borderWidth = 0.5
        pass.layer.borderWidth = 0.5
        googleButton.layer.borderWidth = 1.0
        create.layer.borderWidth = 1.0
        
        // MARK: - Icono de boton google
        let icon = UIImage(named: "Google")!
        googleButton.setImage(icon, for: .normal)
        googleButton.imageView?.contentMode = .scaleAspectFill
        googleButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        
        //MARK: - Cerrar el keyboard
        let tapGesture = UITapGestureRecognizer(target: self, action:     #selector(tapGestureHandler))
              view.addGestureRecognizer(tapGesture)
        
    }
    //MARK: - Funcion para cerrar el keyboard
    @objc func tapGestureHandler() {
        phone.endEditing(true)
        pass.endEditing(true)
      }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
