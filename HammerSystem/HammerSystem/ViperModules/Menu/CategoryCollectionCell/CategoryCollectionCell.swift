//
//  CategoryCollectionCell.swift
//  HammerSystem
//
//  Created by Олег Филатов on 07.05.2021.
//

import UIKit

class CategoryCollectionCell<T: UIView>: UICollectionViewCell {
    
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
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 0.2).cgColor
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.backgroundColor = UIColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 0.2)
            } else {
                self.backgroundColor = UIColor(red: 243/255, green: 245/255, blue: 249/255, alpha: 1)
            }
        }
    }
}

