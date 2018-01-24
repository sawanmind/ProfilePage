//
//  AppDelegate.swift
//  Profile Page
//
//  Created by iOS Developer on 1/24/18.
//  Copyright © 2018 Genysis. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
     
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.white
        window?.rootViewController = UINavigationController(rootViewController: ProfileVC())
        IQKeyboardManager.sharedManager().enable = true
        
        return true
    }

  

}

