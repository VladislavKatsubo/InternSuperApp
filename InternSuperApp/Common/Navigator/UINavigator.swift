//
//  UINavigator.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 20.07.23.
//

import UIKit
import Combine

protocol UINavigatorProtocol {
    var rootNavigationController: UINavigationController? { get }
    var activePresentingController: UIViewController? { get }
    var activeNavigationController: UINavigationController? { get }

    func push(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?)
    func pop(animated: Bool, completion: (() -> Void)?)
    func present(_ viewController: UIViewController, insideNavigation: Bool, style: UIModalPresentationStyle, animated: Bool)
    func dismiss(animated: Bool, completion: (() -> Void)?)

    func goToRoot(clearRootStack: Bool, animated: Bool, completion: (() -> Void)?)
    func goToViewController(_ viewController: UIViewController, clearRootStack: Bool, animated: Bool, completion: (() -> Void)?)

    func replaceWindowRootController(_ controller: UIViewController, animated: Bool)
    func changeCurrentTab(index: Int)
}

class UINavigator: UINavigatorProtocol {
    enum TypeRootPresenting {
        case basic
        case custom
    }

    private(set) var typeRootPresenting: TypeRootPresenting = .basic
    private(set) var rootPresentingController: UIViewController?
    private var cancellable: AnyCancellable?

    var rootNavigationController: UINavigationController? {
        if let tabBarController = rootPresentingController as? UITabBarController {
            let index = tabBarController.selectedIndex
            return tabBarController.viewControllers?[index] as? UINavigationController
        }

        if let navigationController = rootPresentingController as? UINavigationController {
            return navigationController
        }

        return nil
    }

    var activePresentingController: UIViewController? {
        var controller = rootPresentingController
        while controller?.presentedViewController != nil {
            controller = controller?.presentedViewController
        }

        return controller
    }

    var activeNavigationController: UINavigationController? {
        let controller = activePresentingController === rootPresentingController
        ? rootNavigationController
        : activePresentingController
        return controller as? UINavigationController
    }

    // MARK: - Init/Deinit
    init(rootPresentingController: UIViewController? = nil) {
        defer {
            setupSubscriber()
        }

        guard let rootController = rootPresentingController else {
            self.typeRootPresenting = .basic
            self.rootPresentingController = AppDelegate.shared.window?.rootViewController
            return
        }

        self.typeRootPresenting = .custom
        self.rootPresentingController = rootController
    }

    deinit {
        cancellable?.cancel()
    }

    // MARK: - Setup Subscriber
    func setupSubscriber() {
        cancellable = UIChangedRootControllerPublisher.shared.publisher.sink(receiveValue: { [weak self] value in
            guard let self = self else { return }

            if self.typeRootPresenting == .basic {
                self.rootPresentingController = value
            }
        })
    }

    // MARK: - NavigatorProtocole
    func push(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        activeNavigationController?.pushViewController(viewController: viewController, withAnimation: animated, completion: completion)
    }

    func pop(animated: Bool, completion: (() -> Void)?) {
        activeNavigationController?.popViewController(withAnimation: animated, completion: completion ?? {})
    }

    func present(_ viewController: UIViewController, insideNavigation: Bool, style: UIModalPresentationStyle, animated: Bool) {
        let presentedViewController: UIViewController

        if !insideNavigation || viewController is UINavigationController {
            presentedViewController = viewController
        } else {
            presentedViewController = UINavigationController(rootViewController: viewController)
        }

        presentedViewController.modalPresentationStyle = style
        activePresentingController?.present(presentedViewController, animated: animated, completion: nil)
    }

    func dismiss(animated: Bool, completion: (() -> Void)?) {
        activePresentingController?.presentingViewController?.dismiss(animated: animated, completion: completion)
    }

    func goToRoot(clearRootStack: Bool, animated: Bool, completion: (() -> Void)?) {
        if let rootPresentingController = self.rootPresentingController {
            goToViewController(rootPresentingController, clearRootStack: clearRootStack, animated: animated, completion: completion)
        }
    }

    func goToViewController(_ viewController: UIViewController, clearRootStack: Bool, animated: Bool, completion: (() -> Void)?) {
        if clearRootStack {
            let navigationController = viewController === rootPresentingController ? rootNavigationController : (viewController as? UINavigationController)
            navigationController?.popToRootViewController(animated: animated)
        }

        // Check that we present more then one controller
        if viewController.presentedViewController?.presentedViewController != nil {
            let navigationController = viewController.presentedViewController as? UINavigationController

            if let topController = activeNavigationController?.topViewController {
                navigationController?.pushViewController(topController, animated: animated)
            }
        }

        viewController.dismiss(animated: animated, completion: completion)
    }

    func replaceWindowRootController(_ controller: UIViewController, animated: Bool) {
        guard let window = AppDelegate.shared.window else {
            print("Root window not found!")
            return
        }

        guard animated, let snapshot = window.snapshotView(afterScreenUpdates: true) else {
            window.rootViewController = controller
            window.makeKeyAndVisible()
            return
        }

        controller.view.addSubview(snapshot)

        UIChangedRootControllerPublisher.shared.changeRootController(controller: controller)

        UIView.transition(with: snapshot,
                          duration: 0.3,
                          options: .transitionCrossDissolve) {
                                snapshot.layer.opacity = 0
                          } completion: { _ in
                                snapshot.removeFromSuperview()
                          }
    }

    func changeCurrentTab(index: Int) {
        if let tabBarController = rootPresentingController as? UITabBarController {
            tabBarController.selectedIndex = index
        }
    }
}
