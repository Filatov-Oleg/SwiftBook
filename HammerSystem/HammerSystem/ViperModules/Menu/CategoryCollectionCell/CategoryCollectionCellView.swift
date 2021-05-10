//
//  CategoryCollectionCellView.swift
//  HammerSystem
//
//  Created by Олег Филатов on 07.05.2021.
//

import UIKit

class CategoryCollectionCellView: AutoLayoutView {
    private let categoryLabel = UILabel()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.setup()
    }
    
    
    required init?(coder aDecoder: NSCoder){
        fatalError("unsupported")
    }
    
    func setup() {
        self.setupCategoryLabel()
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        [
            self.categoryLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.categoryLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ].forEach{$0.isActive = true}
    }
    
    func update(with categoryModel: CategoryModel) {
        self.categoryLabel.text = categoryModel.nameCategory
    }
}

extension CategoryCollectionCellView {
    func setupCategoryLabel() {
        self.addSubview(self.categoryLabel)
        self.categoryLabel.textColor = UIColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 1)
    }
}
