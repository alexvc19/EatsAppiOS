//
//  CardUIView.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 24/12/20.
//

import UIKit

@IBDesignable class CardView: UIView {

    var contentView:UIView?
    @IBInspectable var nibName:String?
    
    @IBOutlet weak var cardImageview: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var estimateTimeLabel: UILabel!
    
    override func awakeFromNib() {
           super.awakeFromNib()
            xibSetup()
       }

       func xibSetup() {
           guard let view = loadViewFromNib() else { return }
           view.frame = bounds
            view.autoresizingMask =
                       [.flexibleWidth, .flexibleHeight]
           addSubview(view)
           contentView = view
       }

       func loadViewFromNib() -> UIView? {
           guard let nibName = nibName else { return nil }
           let bundle = Bundle(for: type(of: self))
           let nib = UINib(nibName: nibName, bundle: bundle)
           return nib.instantiate(
                       withOwner: self,
                       options: nil).first as? UIView
       }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        xibSetup()
        contentView?.prepareForInterfaceBuilder()
    }
}
