//
//  MenuProtocols.swift
//  HammerSystem
//
//  Created by Олег Филатов on 07.05.2021.
//  
//

import Foundation

protocol MenuModuleInput {
	var moduleOutput: MenuModuleOutput? { get }
}

protocol MenuModuleOutput: class {
}

protocol MenuViewInput: class {
}

protocol MenuViewOutput: class {
    func showDetailProductVC(productModel: ProductModel)
}

protocol MenuInteractorInput: class {
}

protocol MenuInteractorOutput: class {
}

protocol MenuRouterInput: class {
    func detailProductVC(_ productModel: ProductModel)
}
