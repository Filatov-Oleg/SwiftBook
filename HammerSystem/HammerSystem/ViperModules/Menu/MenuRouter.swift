//
//  MenuRouter.swift
//  HammerSystem
//
//  Created by Олег Филатов on 07.05.2021.
//  
//

import UIKit

final class MenuRouter: BaseRouter {
    weak var detailProductModuleInput: DetailProductModuleInput?
    
}

extension MenuRouter: MenuRouterInput {
    func detailProductVC(_ productModel: ProductModel) {
        let detailProductContext = DetailProductContext(moduleOutput: nil)
        let detailProductContainer = DetailProductContainer.assemble(with: detailProductContext)
        
        self.detailProductModuleInput = detailProductContainer.input
        
        if let detailProductModuleInput = self.detailProductModuleInput {
            detailProductModuleInput.setDetailProduct(productModel: productModel)
        } else {
            fatalError()
        }
        
        self.navigationController?.present(detailProductContainer.viewController, animated: true)
        
    }
}
