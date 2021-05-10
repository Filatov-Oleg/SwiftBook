//
//  AppDelegate.swift
//  HammerSystem
//
//  Created by Олег Филатов on 07.05.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private var tabBarCoordinator: TabBarCoordinator?

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow()
        
        self.tabBarCoordinator = TabBarCoordinator(window: window)
        self.window = window
        self.tabBarCoordinator?.start()
        
        return true
    }
}

