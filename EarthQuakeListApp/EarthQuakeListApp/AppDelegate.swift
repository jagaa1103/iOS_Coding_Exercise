//
//  AppDelegate.swift
//  EarthQuakeListApp
//
//  Created by Enkhjargal Gansukh on 2020.12.07.
//  Copyright © 2020 Enkhjargal Gansukh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = MainView()
        window?.makeKeyAndVisible()
        
        return true
    }


}

