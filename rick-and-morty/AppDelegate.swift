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
//        let vc = storyboard!.instantiateViewControllerWithIdentifier("TutorSignUp") as! SignUpViewController
//        let navigationController = UINavigationController(rootViewController: vc)
//        self.presentViewController(navigationController, animated: true, completion: nil)
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let homeController = mainStoryBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let navigationController = UINavigationController(rootViewController: homeController)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        return true
    }

}

