//
//  ItemsTableCell.swift
//  HammerSystem
//
//  Created by Олег Филатов on 07.05.2021.
//

import UIKit


class ProductTableCell<T: UIView>: UITableViewCell {
    
    let containerView: T
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.containerView = T(frame: .zero)
        super.init(style: .default, reuseIdentifier: .none)
        self.contentView.addSubview(self.containerView)
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("unsupported")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.containerView.frame = self.contentView.frame
        self.containerView.backgroundColor = .white
    }
}
