//
//  AppDelegate.swift
//  UIGestureRecognizer
//
//  Created by Олег Филатов on 16.03.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        
        
        window.rootViewController = ViewController()
        window.makeKeyAndVisible()
        
        self.window = window
        return true
    }

}

