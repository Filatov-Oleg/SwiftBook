//
//  DetailProductViewController.swift
//  HammerSystem
//
//  Created by Олег Филатов on 09.05.2021.
//  
//

import UIKit
import PinLayout

final class DetailProductViewController: UIViewController {
    
	private let output: DetailProductViewOutput
    
    private let productImageView = UIImageView()
    private let nameProductLabel = UILabel()
    private let ingredientsLabel = UILabel()

    init(output: DetailProductViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 243/255, green: 245/255, blue: 249/255, alpha: 1)
        self.setupProductImageView()
        self.setupNameProductLabel()
        self.setupIngredientsLabel()
        
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.productImageView.pin
            .top(self.view.pin.safeArea.top)
            .hCenter()
            .sizeToFit()
        
        self.nameProductLabel.pin
            .below(of: self.productImageView)
            .marginTop(26)
            .horizontally()
            .sizeToFit(.width)
        
        self.ingredientsLabel.pin
            .below(of: self.nameProductLabel)
            .marginTop(8)
            .horizontally(16)
            .sizeToFit(.width)
    }
    

}

extension DetailProductViewController: DetailProductViewInput {
    func configureDetailProduct(with productModel: ProductModel) {
        self.productImageView.image = UIImage(named: productModel.imageProduct)
        self.nameProductLabel.text = productModel.nameProduct
        self.ingredientsLabel.text = productModel.ingredients
    }
}


extension DetailProductViewController {
    func setupProductImageView() {
        self.view.addSubview(self.productImageView)
    }
    
    func setupNameProductLabel() {
        self.view.addSubview(self.nameProductLabel)
        self.nameProductLabel.textColor = .black
        self.nameProductLabel.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        self.nameProductLabel.textAlignment = .center
    }
    
    func setupIngredientsLabel() {
        self.view.addSubview(self.ingredientsLabel)
        self.ingredientsLabel.textColor = .black
        self.ingredientsLabel.numberOfLines = 0
        self.ingredientsLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        self.ingredientsLabel.textAlignment = .center
    }
}
