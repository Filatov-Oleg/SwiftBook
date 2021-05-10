//
//  BaseRouter.swift
//  HammerSystem
//
//  Created by Олег Филатов on 09.05.2021.
//

import UIKit

class BaseRouter {
    var navigationControllerProvider: (() -> UINavigationController?)?

    var navigationController: UINavigationController? {
        self.navigationControllerProvider?()
    }

}
