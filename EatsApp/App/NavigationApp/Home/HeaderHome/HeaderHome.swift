//
//  HeaderHome.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 12/01/21.
//

import UIKit
import FirebaseFirestore
import FirebaseUI
import FirebaseFirestoreSwift

class HeaderHome: UIView, UICollectionViewDelegate {

    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    var slider = "sliderCell"
    var categ = "categorieCell"
    
    var photos = [Photos]()
    
    private func initCollectionView() {

        sliderCollectionView.register(UINib(nibName: "SliderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: slider)
        categoriesCollectionView.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: categ)
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
        
        sliderCollectionView.dataSource = self
        sliderCollectionView.delegate = self
        
        //MARK: - Firebase Service
        FIRFirestoreService.shared.read(from: .photos, returning: Photos.self) { (photos) in
            self.photos = photos
            
            //CollectionView Reload data
            DispatchQueue.main.async {
                self.sliderCollectionView.reloadData()
            }
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("HeaderHome", owner: self, options: nil)![0] as! UIView
    
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
        initCollectionView()
    }


}
extension HeaderHome: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == categoriesCollectionView {
            return 8
        }
        return photos.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = sliderCollectionView.dequeueReusableCell(withReuseIdentifier: slider, for: indexPath) as? SliderCollectionViewCell else {
            fatalError("cant dequeue cell")
        }
        
        if (collectionView == categoriesCollectionView){
            let celld = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: categ, for: indexPath) as! CategoriesCollectionViewCell
            
            celld.name.text = "Category"
            return celld
    
        }
        
        let photo = photos[indexPath.row]
        let url: URL? = photo.urlPhoto
        
        cell.photoImageView.sd_setImage(with: url)
        
        return cell
    }
}
