//
//  MainViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 11/12/20.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var pageView: UIPageControl!
    @IBOutlet weak var ubicationTextF: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slidePhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MyCollectionCell
        
        cell?.imageView.image = UIImage(named: slidePhotos[indexPath.row])
        cell?.imageView.layer.cornerRadius = 5.0
        return cell!
    
    }
    
    var slidePhotos:[String] = ["pizza1","pizza2","pizza3","pizza4"]
    var timer: Timer?
    var currentcellindex = 0
    
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
        
        //MARK: - UIPageControl
        pageView.currentPage = 0
        pageView.numberOfPages = slidePhotos.count
        
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(slideToNext), userInfo: nil,repeats: true)
        }
    @objc func slideToNext(){
        if currentcellindex < slidePhotos.count-1{
            currentcellindex = currentcellindex + 1
        }else {
            currentcellindex = 0
        }
        
        pageView.currentPage = currentcellindex
        
        collectionView.scrollToItem(at: IndexPath(item: currentcellindex, section: 0), at: .right, animated: true)
    }
    
    //MARK: - Funcion para cerrar el keyboard
    @objc func tapGestureHandler() {
        ubicationTextF.endEditing(true)
       
      }
}
