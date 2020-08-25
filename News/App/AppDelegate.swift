//
//  AppDelegate.swift
//  News
//
//  Created by Sergei Rosliakov on 25.08.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let viewController = ArticlesViewController()
        let navVC = UINavigationController(rootViewController: viewController)
        UIApplication.shared.delegate?.window??.rootViewController = navVC
        
        return true
    }
}

