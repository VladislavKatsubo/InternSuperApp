//
//  SceneDelegate.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 20.06.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        window.makeKeyAndVisible()


//        let nvc = UINavigationController(rootViewController: DynamicUIChangesViewController())

        let vc = CompoundViewFactory().createController()
        
        window.rootViewController = vc
        self.window = window
    }
}
