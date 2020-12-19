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
import Kingfisher

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
    
    //MARK: - Varibles del slider principal
    //array de las imagenes
    var slidePhotos:[String] = ["pizza1","pizza2","pizza3","pizza4"]
    //variable del timer
    var timer: Timer?
    //variable del PageControl
    var currentcellindex = 0
    
    //fotos de las categorias
    var categoriesPhotos:[String] = [
        "categori1",
        "categori2",
        "categoria3",
        "categoria4"
    ]
    //nombre de las categorias
    var namecategories:[String] = [
        "Hamburguesas",
        "Pizza",
        "Sushi",
        "Postres"
    ]
    //fotos card "mas popular"
    var cardsPhotos:[String] = [
        "card1",
        "card2",
    ]
    //card nombre de la comida "mas popular"
    var namesOfFood:[String]=[
        "Pollo Frito",
        "Sushi"
    ]
    
    var photos = [Photos]()
    var users = [User]()
    
    
    var waitTime = "30 - 40 minutos"
    

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FIRFirestoreService.shared.read(from: .photos, returning: Photos.self) { (photos) in
            self.photos = photos
            
            DispatchQueue.main.async {
                self.PrincipalCollectionView.reloadData()
            }
            self.pageView?.currentPage = 0
            self.pageView?.numberOfPages = photos.count
        }
        
        //MARK: - Icono a texfield de ubicacion
        let imageView = UIImageView()
        let icon = UIImage(named: "Pin")
        imageView.image = icon
        ubicationTextF?.leftView = imageView
        ubicationTextF?.leftViewMode = UITextField.ViewMode.always
    
        
        //MARK: - Cerrar el keyboard
        let tapGesture = UITapGestureRecognizer(target: self, action:     #selector(tapGestureHandler))
            view.addGestureRecognizer(tapGesture)
        
        //MARK: - UIPageControl del slide principal
       
        
        //timer del slider principal
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(slideToNext), userInfo: nil,repeats: true)
        }
    
    //funcion para controlar el timer del slider principal
    @objc func slideToNext(){
        if currentcellindex < slidePhotos.count - 1{
            currentcellindex = currentcellindex + 1
        }else {
            currentcellindex = 0
        }
        
        pageView?.currentPage = currentcellindex
        
        PrincipalCollectionView?.scrollToItem(at: IndexPath(item: currentcellindex, section: 0), at: .right, animated: true)
    }

    
    //MARK: - funciones datasorce y delegate CollectionView principal y categorias
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if(collectionView == PrincipalCollectionView){

            return photos.count
        }
        if(collectionView == cardCollectionView){
            return cardsPhotos.count
        }
        
        return categoriesPhotos.count
    }
    
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = PrincipalCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PrincipalCollectionCell
        
        if (collectionView == PrincipalCollectionView){
            
        //MARK: - Consulta de la base de datos cloudFirestore para el slider principa
            
            let photo = photos[indexPath.row]
            let img = photo.urlPhoto
            let url: URL? = URL(string: img)
            cell?.PrincipalimageView.kf.setImage(with: url)
            cell?.PrincipalimageView.layer.cornerRadius = 5.0
           
            
        return cell!
    }

        if (collectionView == categoriesCollectionView){
            let cell2 = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier:"cell2", for: indexPath) as? CategoriesCollectionViewCell
            
            cell2?.categorieImageView.image = UIImage(named: categoriesPhotos[indexPath.row])
            cell2?.categorieImageView.layer.cornerRadius = 5.0
            cell2?.nameCategorie.text = namecategories[indexPath.row]
            return cell2!
        }
        if (collectionView == cardCollectionView){
            let cellCard = cardCollectionView.dequeueReusableCell(withReuseIdentifier: "cellCard", for: indexPath) as? CardCollectionViewCell
           
            cellCard?.cardImageView.image = UIImage(named: cardsPhotos[indexPath.row])
            cellCard?.nameFoodLabel.text = namesOfFood[indexPath.row]
            cellCard?.waitLabel.text = waitTime
            
            //borders
            cellCard?.layer.borderColor = (UIColor .black).cgColor
            cellCard?.layer.borderWidth = 0.22
            
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
