//
//  AppDelegate.swift
//  Movies
//
//  Created by Roman Zhukov on 23.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MovieDetailsViewController()
        window?.makeKeyAndVisible()
        
        return true
    }

}

