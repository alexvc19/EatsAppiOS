//
//  SearchViewController.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 01/01/21.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var collectionViewCategories: UICollectionView!
    
    let names:[String] = [
        "China",
        "Sushi",
        "Cafe",
        "Tacos"
    ]
    let image:[String] = [
        "search",
        "search",
        "search",
        "search"
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewCategories.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PrincipalCategoriesCollectionViewCell
        
        cell?.categorieImage.image = UIImage(named: "search")
        cell?.categorieName.text = "CATEGORIA"

        return cell!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
