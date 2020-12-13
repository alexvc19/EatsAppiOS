//
//  MainViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 11/12/20.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var ubicationTextF: UITextField!
    
    
    //IBOutlet slidePrincipal
    @IBOutlet weak var pageView: UIPageControl!
    @IBOutlet weak var principalCollectionView: UICollectionView!
   
    //IBOutlets slideCategories
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    //MARK: - Varibles del slider principal
    //array de las imagenes
    var slidePhotos:[String] = ["pizza1","pizza2","pizza3","pizza4"]
    //variable del timer
    var timer: Timer?
    //variable del PageControl
    var currentcellindex = 0
    
    var categoriesPhotos:[String] = [
        "categori1",
        "categori2",
        "categoria3",
        "categoria4"
    ]
    var namecategories:[String] = [
        "Hamburguesas",
        "Pizza",
        "Sushi",
        "Postres"
    ]
    
    //MARK: - funciones datasorce y delegate CollectionView principal y categorias
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if(collectionView == principalCollectionView){
            return slidePhotos.count
        }
        
        return categoriesPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = principalCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PrincipalCollectionCell
        
        cell?.imageView.image = UIImage(named: slidePhotos[indexPath.row])
        cell?.imageView.layer.cornerRadius = 5.0
        
        if (collectionView == categoriesCollectionView){
            let cell2 = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier:"cell2", for: indexPath) as? CategoriesCollectionViewCell
            
            cell2?.categorieImageView.image = UIImage(named: categoriesPhotos[indexPath.row])
            cell2?.categorieImageView.layer.cornerRadius = 5.0
            cell2?.nameCategorie.text = namecategories[indexPath.row]
            return cell2!
        }
        return cell!
    
    }
    /*
    //MARK: -funciones datasorce y delegate CollectionView celda slide Categoria
    func categoriesCollectionView(_ categoriesCollectionView: UICollectionView, numberOfitems section: Int) -> Int{
        return categoriesPhotos.count
    }
    func categoriesCollectionView(_ categoriesCollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let celld = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "celld", for: indexPath) as? CategoriesCollectionViewCell
        
        celld?.categorieImageView.image = UIImage(named: categoriesPhotos[indexPath.row])
        celld?.categorieImageView.layer.cornerRadius = 5.0
        return celld!
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - Icono a texfield de ubicacion
        let imageView = UIImageView()
        let icon = UIImage(named: "Pin")
        imageView.image = icon
        ubicationTextF.leftView = imageView
        ubicationTextF.leftViewMode = UITextField.ViewMode.always
    
        
        //MARK: - Cerrar el keyboard
        let tapGesture = UITapGestureRecognizer(target: self, action:     #selector(tapGestureHandler))
            view.addGestureRecognizer(tapGesture)
        
        //MARK: - UIPageControl del slide principal
        pageView.currentPage = 0
        pageView.numberOfPages = slidePhotos.count
        
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
        
        pageView.currentPage = currentcellindex
        
        principalCollectionView.scrollToItem(at: IndexPath(item: currentcellindex, section: 0), at: .right, animated: true)
    }
    
    //MARK: - Funcion para cerrar el keyboard
    @objc func tapGestureHandler() {
        ubicationTextF.endEditing(true)
       
      }
}


