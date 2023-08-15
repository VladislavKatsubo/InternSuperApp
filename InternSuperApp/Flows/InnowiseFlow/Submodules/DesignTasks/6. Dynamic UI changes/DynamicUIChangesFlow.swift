//
//  DynamicUIChangesFlow.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 28.06.23.
//

import UIKit

final class DynamicUIChangesFlow {
    private(set) var navigator: DynamicUIChangesFlowNavigatorProtocol

    // MARK: - Init
    init(navigator: DynamicUIChangesFlowNavigatorProtocol) {
        self.navigator = navigator
    }

    // MARK: - Public methods
    func makeStartFlow() -> UIViewController {
        let handlers: DynamicUIChangesResources.Handlers = .init(
            onHideShow: { [weak self] in
                guard let self = self else { return }

                let viewController = self.makeHideShowViewController()

                self.navigator.push(viewController, animated: true, completion: nil)
            },
            onAddRemove: { [weak self] in
                guard let self = self else { return }

                let viewController = self.makeAddRemoveViewController()

                self.navigator.push(viewController, animated: true, completion: nil)
            },
            onAlphaAddRemove: { [weak self] in
                guard let self = self else { return }

                let viewController = self.makeAlphaAddRemoveViewController()

                self.navigator.push(viewController, animated: true, completion: nil)
            }
        )

        return DynamicUIChangesFactory().createController(handlers: handlers)
    }
}

private extension DynamicUIChangesFlow {
    // MARK: - Private methods
    func makeHideShowViewController() -> UIViewController {
        return HideShowFactory().createController()
    }

    func makeAddRemoveViewController() -> UIViewController {
        return AddRemoveFactory().createController()
    }

    func makeAlphaAddRemoveViewController() -> UIViewController {
        return AlphaAddRemoveFactory().createController()
    }
}
