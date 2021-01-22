//
//  AppDelegate.swift
//  CYAutoRectView
//
//  Created by 747654832@qq.com on 01/21/2021.
//  Copyright (c) 2021 747654832@qq.com. All rights reserved.
//

import UIKit
@_exported import CYAutoRectView

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: ViewController())
        self.window?.makeKeyAndVisible()
        
        Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle")?.load()

        return true
    }
}
