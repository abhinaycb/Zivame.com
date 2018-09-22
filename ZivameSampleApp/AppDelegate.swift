//
//  AppDelegate.swift
//  ZivameSampleApp
//
//  Created by Coffeebeans on 20/09/18.
//  Copyright © 2018 Coffeebeans. All rights reserved.
//

import UIKit
import CoreData
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        Auth.auth().signInAnonymously() { [weak self](authResult, error) in
            if(error == nil) {
                self?.window = UIWindow(frame: UIScreen.main.bounds)
                let tabBarController = BaseTabBarViewController()
                self?.window?.rootViewController = tabBarController
                self?.window?.makeKeyAndVisible()
            }
        }
        return true
    }
}

