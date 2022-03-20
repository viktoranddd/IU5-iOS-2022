//
//  AppDelegate.swift
//  lab3
//
//  Created by Viktor Andreev on 11.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let initialViewController = InitialViewController()
        let navigationViewController = UINavigationController(rootViewController: initialViewController)
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
        
        return true
    }


}

