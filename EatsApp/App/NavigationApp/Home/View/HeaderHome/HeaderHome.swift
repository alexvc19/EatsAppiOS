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
    
    var viewModel: EAHomeViewModel? {
        didSet {
            viewModel?.didUpdateCategories = { [weak self] in
                DispatchQueue.main.async {
                    self?.reloadCollections()
                   
                }
            }
        }
    }
    
    var slider = "sliderCell"
    var categ = "categorieCell"
    
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
    func reloadCollections() {
        sliderCollectionView.reloadData()
        categoriesCollectionView.reloadData()
    }
    
}
extension HeaderHome: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.categories.count ?? 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == sliderCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: slider, for: indexPath) as? SliderCollectionViewCell else {
                fatalError("cant dequeue SliderCollectionViewCell")
            }
            return cell
        } else if collectionView == categoriesCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categ, for: indexPath) as? CategoriesCollectionViewCell else {
                fatalError("cant dequeue CategoriesCollectionViewCell")
            }
            if let category = viewModel?.categories[indexPath.item] {
                cell.name.text = category.name.uppercased()
                cell.photoImageView.loadImage(from: category.imageURL, placeholder: UIImage(named: "Example"))
            }
            return cell
        } else {
            fatalError("Unknown collectionView")
        }
    }

}
