//
//  SalesCollectionCell.swift
//  HammerSystem
//
//  Created by Олег Филатов on 08.05.2021.
//

import UIKit

class SalesCollectionCell<T: UIView>: UICollectionViewCell {
    
    let containerView: T
    
    override init(frame: CGRect) {
        self.containerView = T(frame: .zero)
        super.init(frame: frame)
        self.contentView.addSubview(self.containerView)
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("unsupported")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.containerView.frame = self.contentView.frame
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        self.containerView.backgroundColor = UIColor(red: 243/255, green: 245/255, blue: 249/255, alpha: 1)
    }
}

