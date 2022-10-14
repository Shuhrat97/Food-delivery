//
//  AppDelegate.swift
//  Food-Delivery
//
//  Created by Shuhrat Nurov on 13/10/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        showMainView()
        return true
    }
    
    func showMainView(){
        window = UIWindow()
        window?.backgroundColor = .white
        let ctrl = TabBar()
        window?.rootViewController = ctrl
        window?.makeKeyAndVisible()
    }

}

