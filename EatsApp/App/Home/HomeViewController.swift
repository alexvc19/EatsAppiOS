//
//  MainViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 11/12/20.
//

import UIKit
import FirebaseFirestore
import FirebaseUI
import FirebaseFirestoreSwift

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
   
    @IBOutlet weak var PrincipalCollectionView: UICollectionView!
    @IBOutlet weak var ubicationTextF: UITextField!
    //IBOutlet slidePrincipal
    @IBOutlet weak var pageView: UIPageControl!
    //IBOutlets slideCategories
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    //IBOutlets cardFood
    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var card1: CardView!
    
    //MARK: - Varibles del slider principal

    //variable del timer
    var timer: Timer?
    //variable del PageControl
    var currentcellindex = 0
    
    //fotos card "mas popular"
    var cardsPhotos:[String] = [
        "card1",
        "pedido",
    ]
    //card nombre de la comida
    var namesOfFood:[String]=[
        "Pollo Frito",
        "Sushi"
    ]
    
    var photos = [Photos]()
    var users = [User]()
    var photosCategories = [PhotosCategories]()
    
    
    var waitTime = "30 - 40 minutos"
    
    let imagePicker = UIImagePickerController()
    
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    //MARK: -  ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        card1.names?.text = "Sushi"
        card1.waitTime?.text = waitTime
        card1.photo?.image = UIImage(named: "pedido")
        
        //Consulta a la base de datos -> retorna collection photos
        FIRFirestoreService.shared.read(from: .photos, returning: Photos.self) { (photos) in
            self.photos = photos
            
            //CollectionView Reload data
            DispatchQueue.main.async {
                self.PrincipalCollectionView.reloadData()
            }
            //print("error\(photos)")
            
            //UIPageControl del slide principal
            self.pageView?.currentPage = 0
            self.pageView?.numberOfPages = photos.count
        }
        
        FIRFirestoreService.shared.read(from: .categories, returning: PhotosCategories.self) { (photosCategories) in
            self.photosCategories = photosCategories
            
            DispatchQueue.main.async {
                self.categoriesCollectionView.reloadData()
            }
        }
        
        //Icono a texfield de ubicacion
        let imageView = UIImageView()
        let icon = UIImage(named: "Pin")
        imageView.image = icon
        ubicationTextF?.leftView = imageView
        ubicationTextF?.leftViewMode = UITextField.ViewMode.always
    
        
        // Cerrar el keyboard
        let tapGesture = UITapGestureRecognizer(target: self, action:     #selector(tapGestureHandler))
            view.addGestureRecognizer(tapGesture)
        
      
       
        //timer del slider principal
        timer = Timer.scheduledTimer(timeInterval: 7.0, target: self, selector: #selector(slideToNext), userInfo: nil,repeats: true)
        }
    
    //funcion para controlar el timer del slider principal
    @objc func slideToNext(){
        if currentcellindex < photos.count - 1{
            currentcellindex = currentcellindex + 1
        }else {
            currentcellindex = 0
        }
        
        pageView?.currentPage = currentcellindex
        
        PrincipalCollectionView?.scrollToItem(at: IndexPath(item: currentcellindex, section: 0), at: .right, animated: true)
    }

    
    //MARK: - CollectionView principal funciones datasorce y delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if(collectionView == PrincipalCollectionView){
            return photos.count
        }
        if(collectionView == cardCollectionView){
            return cardsPhotos.count
        }
        if(collectionView == categoriesCollectionView){
            return photosCategories.count
        }

        return photosCategories.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = PrincipalCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PrincipalCollectionCell
        
        if (collectionView == PrincipalCollectionView){
            //coloca la imagen url de la base de datos en el ImageView
            let photo = photos[indexPath.row]
            let url: URL? = photo.urlPhoto
            
            cell?.PrincipalimageView.sd_setImage(with: url)
            
        return cell!
    }

        // Celdas de categorias
        if (collectionView == categoriesCollectionView){
            let cell2 = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier:"cell2", for: indexPath) as? CategoriesCollectionViewCell
            let photograp = photosCategories[indexPath.row]
            
            cell2?.categorieImageView.sd_setImage(with: URL(string: photograp.icon))
            
            cell2?.nameCategorie.text = photograp.categorieName
            return cell2!
        }
        // Celdas de cards horizontal
        if (collectionView == cardCollectionView){
            let cellCard = cardCollectionView.dequeueReusableCell(withReuseIdentifier: "cellCard", for: indexPath) as? CardCollectionViewCell
           
            cellCard?.cardImageView.image = UIImage(named: cardsPhotos[indexPath.row])
            cellCard?.nameFoodLabel.text = namesOfFood[indexPath.row]
            cellCard?.waitLabel.text = waitTime
            
            //borders
            //shadow
            cellCard?.backgroundColor = .clear // very important
            cellCard?.layer.masksToBounds = false
            cellCard?.layer.shadowOpacity = 0.22
            cellCard?.layer.shadowRadius = 3
            cellCard?.layer.shadowOffset = CGSize(width: 0, height: 5)
            cellCard?.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
            
            cellCard?.contentView.backgroundColor = .white
            cellCard?.contentView.layer.cornerRadius = 0
            
            
            return cellCard!
            
        }
        
        return cell!
    
    }
    //MARK: - Funcion para cerrar el keyboard
    @objc func tapGestureHandler() {
        ubicationTextF.endEditing(true)
       
      }
}
