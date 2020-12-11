//
//  AppDelegate.swift
//  lyxpjone
//
//  Created by lyx on 2020/12/11.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        self.window?.rootViewController = UINavigationController.init(rootViewController: ViewController())
        self.window?.makeKeyAndVisible()
        return true
    }


}

