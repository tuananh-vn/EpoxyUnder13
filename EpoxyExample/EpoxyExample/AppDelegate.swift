//
//  AppDelegate.swift
//  EpoxyExample
//
//  Created by Dong Tuan Anh on 07/05/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = FlowLayoutViewController()
        self.window?.backgroundColor = .black
        self.window?.makeKeyAndVisible()
        
        return true
    }


}

