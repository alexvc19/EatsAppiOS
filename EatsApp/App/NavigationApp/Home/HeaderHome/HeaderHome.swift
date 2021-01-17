//
//  HeaderHome.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 12/01/21.
//

import UIKit

class HeaderHome: UIView, UICollectionViewDelegate {

    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    var slider = "sliderCell"
    var categ = "categorieCell"
    
    var photos = [Photos]()
    var photosCategories = [PhotosCategories]()
    
    private func initCollectionView() {
       
        sliderCollectionView.register(UINib(nibName: "SliderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: slider)
        categoriesCollectionView.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: categ)
        
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
        
        sliderCollectionView.dataSource = self
        sliderCollectionView.delegate = self
        
        
        //MARK: - Consulta de firebase
        //Consulta a la base de datos -> retorna collection photos
        FIRFirestoreService.shared.read(from: .photos, returning: Photos.self) { (photos) in
            self.photos = photos
            
            DispatchQueue.main.async {
                self.sliderCollectionView.reloadData()
            }
        
        }
        FIRFirestoreService.shared.read(from: .categories, returning: PhotosCategories.self) { (photosCategories) in self.photosCategories = photosCategories
            
            DispatchQueue.main.async {
                self.categoriesCollectionView.reloadData()
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
//MARK: - CollectionView DataSorce
extension HeaderHome: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == categoriesCollectionView {
            return photosCategories.count
        }
        return photos.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = sliderCollectionView.dequeueReusableCell(withReuseIdentifier: slider, for: indexPath) as? SliderCollectionViewCell else {
            fatalError("cant dequeue cell")
        }
        
        if (collectionView == categoriesCollectionView){
            let celld = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: categ, for: indexPath) as! CategoriesCollectionViewCell
            
            let photograp = photosCategories[indexPath.row]
            
            celld.name.text = photograp.categorieName
            celld.photoImageView.sd_setImage(with: URL(string:  photograp.icon))
            
            return celld
    
        }
    
        let photo = photos[indexPath.row]
        let url:URL? = photo.urlPhoto
        
        cell.photoImageView.sd_setImage(with: url)
        
        return cell
    }
}

