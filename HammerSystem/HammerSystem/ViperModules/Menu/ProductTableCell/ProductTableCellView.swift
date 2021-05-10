//
//  ItemsTableCellView.swift
//  HammerSystem
//
//  Created by Олег Филатов on 07.05.2021.
//

import UIKit

class ProductTableCellView: AutoLayoutView {
    
    private let productImageView = UIImageView()
    private let nameProductLabel = UILabel()
    private let ingredientsLabel = UILabel()
    private let priceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.setupProductImageView()
        self.setupNameProductLabel()
        self.setupIngredientsLabel()
        self.setupPriceLabel()
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        [
            self.productImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            self.productImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0),
            self.productImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            self.productImageView.widthAnchor.constraint(equalToConstant: self.frame.height-40),
            
            self.nameProductLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 32.0),
            self.nameProductLabel.leadingAnchor.constraint(equalTo: self.productImageView.trailingAnchor, constant: 32.0),
            self.nameProductLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0),
            
            self.ingredientsLabel.topAnchor.constraint(equalTo: self.nameProductLabel.bottomAnchor, constant: 8.0),
            self.ingredientsLabel.leadingAnchor.constraint(equalTo: self.productImageView.trailingAnchor, constant: 32.0),
            self.ingredientsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24.0),
            
            self.priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25.0),
            self.priceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16.0),
            self.priceLabel.widthAnchor.constraint(equalToConstant: 87),
            self.priceLabel.heightAnchor.constraint(equalToConstant: 32)
            
        ].forEach{$0.isActive = true}
    }
    
    func update(with productModel: ProductModel) {
        self.productImageView.image = UIImage(named: productModel.imageProduct)
        self.nameProductLabel.text = productModel.nameProduct
        self.ingredientsLabel.text = productModel.ingredients
        self.priceLabel.text = "от \(productModel.price) р"
    }
}

extension ProductTableCellView {
    func setupNameProductLabel() {
        self.addSubview(self.nameProductLabel)
        self.nameProductLabel.font = UIFont(name: "Arial", size: 17)
        self.nameProductLabel.textColor = .black
        self.nameProductLabel.numberOfLines = 1
    }
    
    func setupProductImageView() {
        self.addSubview(self.productImageView)
    }
    
    func setupIngredientsLabel() {
        self.addSubview(self.ingredientsLabel)
        self.ingredientsLabel.font = UIFont(name: "Arial", size: 13)
        self.ingredientsLabel.textColor = .gray
        self.ingredientsLabel.numberOfLines = 0
    }
    
    func setupPriceLabel() {
        self.addSubview(self.priceLabel)
        self.priceLabel.font = UIFont(name: "Arial", size: 15)
        self.priceLabel.textAlignment = .center
        self.priceLabel.layer.cornerRadius = 6
        self.priceLabel.layer.borderWidth = 1
        self.priceLabel.layer.borderColor = UIColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 1).cgColor
        self.priceLabel.textColor = UIColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 1)
    }
}
