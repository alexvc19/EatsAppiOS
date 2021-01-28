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
    
    let objViewController = UIApplication.topViewController()!
    
    private func initCollectionView() {
       
        sliderCollectionView.register(UINib(nibName: "SliderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: slider)
        
        categoriesCollectionView.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: categ)
        
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
        
        sliderCollectionView.dataSource = self
        sliderCollectionView.delegate = self
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoriesCollectionView {
            
            let categoriesID = "Categories"
            let vc = UIStoryboard.init(name: categoriesID, bundle: Bundle.main).instantiateViewController(withIdentifier: categoriesID)
            objViewController.navigationController?.show(vc, sender: nil)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == categoriesCollectionView {
            return 8
        }
        return 4

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
    
        cell.photoImageView.image = UIImage(named: "pizza1")
        return cell
    }
}

