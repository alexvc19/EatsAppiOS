//
//  SearchViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 01/01/21.
//
import UIKit

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var collectionViewCategories: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewCategories.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PrincipalCategoriesCollectionViewCell
        cell?.categorieName.text = "cola"
        return cell!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action:     #selector(tapGestureHandler))
            view.addGestureRecognizer(tapGesture)
    }
    @objc func tapGestureHandler() {
        
       
      }

}

