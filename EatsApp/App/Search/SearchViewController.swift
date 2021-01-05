//
//  SearchViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 01/01/21.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var  searchTextField: UITextField!
    @IBOutlet weak var collectionViewCategories: UICollectionView!

    var photosCategories = [PhotosCategories]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewCategories.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PrincipalCategoriesCollectionViewCell
        
        let photograp = photosCategories[indexPath.row]
        
        cell?.categorieImage.sd_setImage(with: URL(string: photograp.photoUrl))
        
        cell?.categorieName.text = photograp.categorieName

        return cell!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        FIRFirestoreService.shared.read(from: .categories, returning: PhotosCategories.self) { (photosCategories) in
            self.photosCategories = photosCategories
            
            DispatchQueue.main.async {
                self.collectionViewCategories.reloadData()
            }
        }
        let tapGesture = UITapGestureRecognizer(target: self, action:     #selector(tapGestureHandler))
            view.addGestureRecognizer(tapGesture)
    }
    @objc func tapGestureHandler() {
        searchTextField.endEditing(true)
       
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
