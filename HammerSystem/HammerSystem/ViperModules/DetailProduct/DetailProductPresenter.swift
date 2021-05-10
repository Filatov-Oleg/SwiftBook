//
//  DetailProductPresenter.swift
//  HammerSystem
//
//  Created by Олег Филатов on 09.05.2021.
//  
//

import Foundation

final class DetailProductPresenter {
	weak var view: DetailProductViewInput?
    weak var moduleOutput: DetailProductModuleOutput?

	private let router: DetailProductRouterInput
	private let interactor: DetailProductInteractorInput

    init(router: DetailProductRouterInput, interactor: DetailProductInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension DetailProductPresenter: DetailProductModuleInput {
    func setDetailProduct(productModel: ProductModel) {
        self.view?.configureDetailProduct(with: productModel)
    }
}

extension DetailProductPresenter: DetailProductViewOutput {
}

extension DetailProductPresenter: DetailProductInteractorOutput {
}
