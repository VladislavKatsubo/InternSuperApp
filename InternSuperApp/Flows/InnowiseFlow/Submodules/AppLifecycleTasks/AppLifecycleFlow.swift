//
//  AppLifecycleFlow.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 16.08.23.
//

import UIKit

final class AppLifecycleFlow {
    private let navigator: AppLifecycleFlowNavigatorProtocol

    init(navigator: AppLifecycleFlowNavigatorProtocol) {
        self.navigator = navigator
    }

    func makeStartFlow() -> UIViewController {

        let handlers: CounterResources.Handlers = .init(
            onUpdateCounterView: { [weak self] in
                guard let self = self else { return }

                let viewController = self.makeUpdateCounterViewController()
                
                self.navigator.push(viewController, animated: true, completion: nil)
            }
        )

        let counterViewController = CounterFactory().createController(handlers: handlers)

        return counterViewController
    }
}

private extension AppLifecycleFlow {
    // MARK: - Private methods
    func makeUpdateCounterViewController() -> UIViewController {
        let handlers: UpdateCounterResources.Handlers = .init(
            onBackAction: { [weak self] in
                self?.navigator.pop(animated: true, completion: nil)
            }
        )
        let viewController = UpdateCounterFactory().createController(handlers: handlers)

        return viewController
    }
}
