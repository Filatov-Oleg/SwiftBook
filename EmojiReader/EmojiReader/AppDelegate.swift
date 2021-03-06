//
//  AppDelegate.swift
//  EmojiReader
//
//  Created by Олег Филатов on 10.10.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

//func setupBasket(){
//    guard let navController = self.navigationControllers[.basket] else {
//        fatalError("can't finid navController")
//    }
//    //let basketContext = BasketContext(output: nil)
//    let reserveContainer = ReserveContainer.assemble()
//    navController.setViewControllers([reserveContainer.viewController], animated: false)
//    reserveContainer.viewController.navigationItem.title = NavControllerType.basket.title
//}
//
//func setupAccount(){
//    guard let navController = self.navigationControllers[.account] else {
//        fatalError("can't finid navController")
//    }
//    let userProfileContainer = UserProfileContainer.assemble()
//    navController.setViewControllers([userProfileContainer.viewController], animated: false)
//    userProfileContainer.viewController.navigationItem.title = NavControllerType.account.title
//}
