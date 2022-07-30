//
//  AppDelegate.swift
//  view-related-Notifications
//
//  Created by Derrick kim on 2022/07/30.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("AppDelegate - didFinishLaunchingWithOptions launchOptions")
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("AppDelegate - applicationWillEnterForeground")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("AppDelegate - applicationDidEnterBackground")
    }

    
    func applicationWillTerminate(_ application: UIApplication) {
        print("AppDelegate - applicationWillTerminate")
    }
}

