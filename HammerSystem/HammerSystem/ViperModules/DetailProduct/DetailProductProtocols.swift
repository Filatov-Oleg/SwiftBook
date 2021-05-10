//
//  DetailProductProtocols.swift
//  HammerSystem
//
//  Created by Олег Филатов on 09.05.2021.
//  
//

import Foundation

protocol DetailProductModuleInput: class {
	var moduleOutput: DetailProductModuleOutput? { get }
    func setDetailProduct(productModel: ProductModel)
}

protocol DetailProductModuleOutput: class {
}

protocol DetailProductViewInput: class {
    func configureDetailProduct(with productModel: ProductModel)
}

protocol DetailProductViewOutput: class {
}

protocol DetailProductInteractorInput: class {
}

protocol DetailProductInteractorOutput: class {
}

protocol DetailProductRouterInput: class {
}
