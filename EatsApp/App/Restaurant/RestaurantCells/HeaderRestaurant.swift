//
//  HeaderRestaurant.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 09/01/21.
//

import UIKit

class HeaderRestaurant: UIView, UICollectionViewDelegate {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    @IBOutlet weak var resImageView: UIImageView!
    @IBOutlet weak var estimateTimeLabel: UILabel!
    @IBOutlet weak var resAddresLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    let cellIdentifier = "menucell"
    
      
    
    private func initCollectionView() {
       
        menuCollectionView.register(UINib(nibName: "MenuCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "menucell")
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
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
        let viewFromXib = Bundle.main.loadNibNamed("HeaderRestaurant", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
        initCollectionView()
    }

}
extension HeaderRestaurant: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = menuCollectionView.dequeueReusableCell(withReuseIdentifier: "menucell", for: indexPath) as? MenuCollectionViewCell else {
            
            fatalError("cant dequeue cell")
        }
        cell.nameLabel?.text = "hola"
        cell.menuImageView?.image = UIImage(named: "points")
        return cell
    }
}
