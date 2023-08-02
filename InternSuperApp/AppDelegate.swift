//
//  AppDelegate.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 20.06.23.
//

import UIKit

protocol AppDelegateProtocol {
    var context: AppContext! { get }
    var window: UIWindow? { get }
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate, AppDelegateProtocol {
    static let shared: AppDelegateProtocol = UIApplication.shared.delegate as! AppDelegateProtocol

    var context: AppContext!
    var mainFlow: MainFlow!
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)

        context = AppContext.makeContext()

        mainFlow = MainFlow(navigator: MainFlowNavigator())
        guard mainFlow.makeStartFlow(with: window) else { return false }

        return true
    }
}
