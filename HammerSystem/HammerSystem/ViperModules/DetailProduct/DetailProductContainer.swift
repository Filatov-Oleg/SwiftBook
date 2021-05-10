//
//  DetailProductContainer.swift
//  HammerSystem
//
//  Created by Олег Филатов on 09.05.2021.
//  
//

import UIKit

final class DetailProductContainer {
    let input: DetailProductModuleInput
	let viewController: UIViewController
	private(set) weak var router: DetailProductRouterInput!

	class func assemble(with context: DetailProductContext) -> DetailProductContainer {
        let router = DetailProductRouter()
        let interactor = DetailProductInteractor()
        let presenter = DetailProductPresenter(router: router, interactor: interactor)
		let viewController = DetailProductViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return DetailProductContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: DetailProductModuleInput, router: DetailProductRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct DetailProductContext {
	weak var moduleOutput: DetailProductModuleOutput?
}
