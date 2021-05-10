//
//  MenuPresenter.swift
//  HammerSystem
//
//  Created by Олег Филатов on 07.05.2021.
//  
//

import Foundation

final class MenuPresenter {
	weak var view: MenuViewInput?
    weak var moduleOutput: MenuModuleOutput?

	private let router: MenuRouterInput
	private let interactor: MenuInteractorInput

    init(router: MenuRouterInput, interactor: MenuInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension MenuPresenter: MenuModuleInput {
}

extension MenuPresenter: MenuViewOutput {
    func showDetailProductVC(productModel: ProductModel) {
        self.router.detailProductVC(productModel)
    }
    
}

extension MenuPresenter: MenuInteractorOutput {
}
