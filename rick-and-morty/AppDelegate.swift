//
//  AppDelegate.swift
//  rick-and-morty
//
//  Created by Winlentia on 16.01.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let loginController = mainStoryBoard.instantiateViewController(withIdentifier: "HomeViewController")
        self.window?.rootViewController = loginController
        self.window?.makeKeyAndVisible()
        return true
    }

}

