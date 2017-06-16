//
//  AppDelegate.swift
//  ReloadViewAfterFileSave
//
//  Created by Nayem BJIT on 6/15/17.
//  Copyright © 2017 Nayem BJIT. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        saveFile()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
    
    func saveFile() {
        // do your job with your custom class's method for saving
        // you should get a filepath back
        FileStorageHelper().saveToLocalStorage { (filePath) in
            if FileManager.default.fileExists(atPath: filePath) {
                NotificationCenter.default.post(name: Notification.Name("FileWrittenCompletion"), object: nil)
            }
        }
        
    }
    
}
