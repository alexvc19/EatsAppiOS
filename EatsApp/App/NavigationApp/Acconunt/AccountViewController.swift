//
//  AccountViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 02/01/21.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var infoView: OptionsView!
    @IBOutlet weak var payView: OptionsView!
    @IBOutlet weak var addressView: OptionsView!
    @IBOutlet weak var helpView: OptionsView!
    @IBOutlet weak var closeSesionView: OptionsView!
   
    @IBOutlet weak var stack: UIStackView!
    
    //    let imagePicker: UIImagePickerController = UIImagePickerController()
    
//    @IBAction func imgeChange(_ sender: Any) {
//        if UIImagePickerController.isSourceTypeAvailable(.camera){
//            if UIImagePickerController.availableCaptureModes(for: .rear) != nil {
//                imagePicker.allowsEditing = false
//                imagePicker.sourceType = .camera
//                imagePicker.cameraCaptureMode = .photo
//
//                present(imagePicker, animated: true, completion: nil)
//            }
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userImage.layer.cornerRadius = userImage.frame.size.width/2
        
        //Views de opciones
        infoView.icon.image = UIImage(systemName: "chart.bar.doc.horizontal.fill")
        infoView.optionLabel.text = "Informacion personal"
        
        payView.optionLabel.text = "Formas de pago"
        payView.icon.image = UIImage(systemName: "creditcard.fill")
        
        addressView.optionLabel.text = "Direcciones"
        addressView.icon.image = UIImage(systemName: "mappin.and.ellipse")
        
        helpView.optionLabel.text = "Ayuda"
        helpView.icon.image = UIImage(systemName: "questionmark.circle")
        
        closeSesionView.optionLabel.text = "Cerrar sesion"
        closeSesionView.icon.image = UIImage(systemName: "arrow.right.doc.on.clipboard")
    }
    
    
}