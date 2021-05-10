//
//  TabBarController.swift
//  HammerSystem
//
//  Created by Олег Филатов on 07.05.2021.
//

import UIKit

class TabBarCoordinator {
    private let tabBarController = UITabBarController()
    private var window: UIWindow
    private lazy var navigationControllers = TabBarCoordinator.makeNavigationControllers()
    
    init(window: UIWindow) {
        self.window = window
        self.setupAppearance()
    }
    
    func start() {
        self.setupMenu()
        let navigationControllers = NavControllerType.allCases.compactMap {
            self.navigationControllers[$0]
        }
        self.tabBarController.setViewControllers(navigationControllers, animated: true)
        self.window.rootViewController = self.tabBarController
        self.window.makeKeyAndVisible()
    }
    

    
}

private extension TabBarCoordinator {
    
    func setupMenu() {
        guard let navController = self.navigationControllers[.menu] else {
            fatalError("can't find navController")
        }
        let menuContext = MenuContext(moduleOutput: nil)
        let menuContainer = MenuContainer.assemble(with: menuContext)
        navController.setViewControllers([menuContainer.viewController], animated: false)
        //menuContainer.viewController.navigationItem.title = NavControllerType.menu.title
        
    }
    
    func setupAppearance() {
        UINavigationBar.appearance().barTintColor = .black
        UINavigationBar.appearance().tintColor = .gray
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = UIColor(red: 243/255, green: 245/255, blue: 249/255, alpha: 1)
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
            appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
            
            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        } else {
            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().barTintColor = .purple
            UINavigationBar.appearance().isTranslucent = false
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        }
        UINavigationBar.appearance().shadowImage = UIImage()
        
        
        
        
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().tintColor = UIColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 1)
        UITabBar.appearance().unselectedItemTintColor = .gray
    }
    
    static func makeNavigationControllers() -> [NavControllerType : UINavigationController] {
        var result: [NavControllerType : UINavigationController] = [:]
        NavControllerType.allCases.forEach{NavControllerType in
            let navigationController = UINavigationController()
            let tabBarItem =  UITabBarItem(title: NavControllerType.title,
                                           image: NavControllerType.image,
                                           tag: NavControllerType.rawValue)
            navigationController.tabBarItem = tabBarItem
            navigationController.navigationBar.prefersLargeTitles = false // большой титульник, если возомжно
            
            result[NavControllerType] = navigationController
        }
        return result
    }
}


fileprivate enum NavControllerType: Int, CaseIterable {
    case menu, contacts, profile, basket
    
    var title: String{
        switch self {
        case .menu:
            return Localization.menu
        case .contacts:
            return Localization.contacts
        case .profile:
            return Localization.profile
        case .basket:
            return Localization.basket
        }
    }
    
    var image: UIImage? {
        switch self {
        case .menu:
            return UIImage(named: "list.bullet")
        case .contacts:
            return UIImage(named: "mappin.and.ellipse")
        case .profile:
            return UIImage(named: "person.fill")
        case .basket:
            return UIImage(named: "cart.fill")
        }
    }
}
