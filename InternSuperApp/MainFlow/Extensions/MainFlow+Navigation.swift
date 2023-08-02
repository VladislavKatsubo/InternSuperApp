//
//  MainFlow+Navigation.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 22.07.23.
//

import UIKit

extension MainFlow {
    func makeLaunchScreen() -> UIViewController {
        let storyboard = UIStoryboard(name: "LaunchScreen", bundle: nil)
        return storyboard.instantiateViewController(identifier: "LaunchScreen")
    }

    func goToTabBarFlow() {

    }

    func goInnowiseFlow() {
        let controller = makeInnowiseFlow()
        navigator.replaceWindowRootController(controller, animated: true)
    }
}
