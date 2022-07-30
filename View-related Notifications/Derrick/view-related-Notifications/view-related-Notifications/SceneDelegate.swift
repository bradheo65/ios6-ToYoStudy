//
//  SceneDelegate.swift
//  view-related-Notifications
//
//  Created by Derrick kim on 2022/07/30.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        print("SceneDelegate - connectionOptions: UIScene.ConnectionOptions call")
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        print("SceneDelegate - sceneDidDisconnect")
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        print("SceneDelegate - sceneDidBecomeActive call")
    }

    func sceneWillResignActive(_ scene: UIScene) {
        print("SceneDelegate - sceneWillResignActive call")
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        print("SceneDelegate - sceneWillEnterForeground call")
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        print("SceneDelegate - sceneDidEnterBackground call")
    }
}

