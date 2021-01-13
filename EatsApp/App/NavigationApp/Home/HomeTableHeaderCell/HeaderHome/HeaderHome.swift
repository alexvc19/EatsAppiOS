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
    
    private func initCollectionView() {
       
        sliderCollectionView.register(UINib(nibName: "SliderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: slider)
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = sliderCollectionView.dequeueReusableCell(withReuseIdentifier: slider, for: indexPath) as? SliderCollectionViewCell else {
            fatalError("cant dequeue cell")
        }
    
        cell.photoImageView.image = UIImage(named: "pedido")
        return cell
    }
}
