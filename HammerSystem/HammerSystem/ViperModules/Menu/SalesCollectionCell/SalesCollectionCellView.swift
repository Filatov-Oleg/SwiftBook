//
//  SalesCollectionCellView.swift
//  HammerSystem
//
//  Created by Олег Филатов on 08.05.2021.
//

import UIKit

class SalesCollectionCellView: AutoLayoutView {
    private let saleImageView = UIImageView()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.setup()
    }
    

    required init?(coder aDecoder: NSCoder){
        fatalError("unsupported")
    }
    
    func setup() {
        self.setupSaleLabel()
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        [
            self.saleImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.saleImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),

        ].forEach{$0.isActive = true}
    }
    
    func update(with saleModel: SaleModel) {
        self.saleImageView.image = UIImage(named: saleModel.nameSale)
    }
}

extension SalesCollectionCellView {
    func setupSaleLabel() {
        self.addSubview(self.saleImageView)
        self.saleImageView.sizeToFit()
    }
}
