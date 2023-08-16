//
//  InnowiseFlow.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 22.07.23.
//

import UIKit

final class InnowiseFlow {
    private let navigator: InnowiseFlowNavigatorProtocol

    private let dynamicUIChangesFlow: DynamicUIChangesFlow
    private let listTasksFlow: ListTasksFlow
    private let appLifeCycleFlow: AppLifecycleFlow

    init(navigator: InnowiseFlowNavigatorProtocol) {
        self.navigator = navigator

        self.dynamicUIChangesFlow = DynamicUIChangesFlow(navigator: DynamicUIChangesFlowNavigator())
        self.listTasksFlow = ListTasksFlow(navigator: ListTasksFlowNavigator())
        self.appLifeCycleFlow = AppLifecycleFlow(navigator: AppLifecycleFlowNavigator())
    }

    func makeStartFlow() -> UIViewController {
        let designHandlers = InnowiseTasksResources.Handlers.Design(
            onCenteringElements: { [weak self] in
                guard let self = self else { return }

                let viewController = self.makeCenteringElementsViewController()
                self.navigator.push(viewController, animated: true, completion: nil)
            },
            onScrollView: { [weak self] in
                guard let self = self else { return }

                let viewController = self.makeScrollViewWithPinnedButtonViewController()
                self.navigator.push(viewController, animated: true, completion: nil)
            },
            onHorizontalStackViewRelativeSizes: { [weak self] in
                guard let self = self else { return }

                let viewController = self.makeHorizontalStackViewRelativeSizesViewController()
                self.navigator.push(viewController, animated: true, completion: nil)
            },
            onEyeDropper: { [weak self] in
                guard let self = self else { return }

                let viewController = self.makeEyedropperViewController()
                self.navigator.push(viewController, animated: true, completion: nil)
            },
            onCustomLayout: { [weak self] in
                guard let self = self else { return }

                let viewController = self.makeCustomLayoutViewController()
                self.navigator.push(viewController, animated: true, completion: nil)
            },
            onDynamicUIChanges: { [weak self] in
                guard let self = self else { return }

                let viewController = self.dynamicUIChangesFlow.makeStartFlow()
                self.navigator.push(viewController, animated: true, completion: nil)
            },
            onCompoundView: { [weak self] in
                guard let self = self else { return }

                let viewController = self.makeCompoundViewViewController()
                self.navigator.push(viewController, animated: true, completion: nil)
            },
            onCircularProgressBar: { [weak self] in
                guard let self = self else { return }

                let viewController = self.makeCircularProgressBarViewController()
                self.navigator.push(viewController, animated: true, completion: nil)
            }
        )

        let listHandlers = InnowiseTasksResources.Handlers.Lists(
            onTabBarController: { [weak self] in
                guard let self = self else { return }

                let viewController = self.listTasksFlow.makeTabBarFlow()
                self.navigator.push(viewController, animated: true, completion: nil)
            }
        )

        let appLifecycleHandlers = InnowiseTasksResources.Handlers.AppLifecycle(
            onCounterView: { [weak self] in
                guard let self = self else { return }

                let viewController = self.appLifeCycleFlow.makeStartFlow()
                self.navigator.push(viewController, animated: true, completion: nil)
            }
        )

        let innowiseTasksViewController = InnowiseTasksFactory().createController(
            designHandlers: designHandlers,
            listHandlers: listHandlers,
            appLifecycleHandlers: appLifecycleHandlers
        )

        return UINavigationController(rootViewController: innowiseTasksViewController)
    }
}

private extension InnowiseFlow {
    // MARK: - Private methods
    func makeCenteringElementsViewController() -> UIViewController {
        let handlers: CenteredViewResources.Handlers = .init()
        let viewController = CenteredViewFactory().createController(handlers: handlers)

        return viewController
    }

    func makeScrollViewWithPinnedButtonViewController() -> UIViewController {
        let handlers: ScrollViewWithPinnedButtonResources.Handlers = .init()
        let viewController = ScrollViewWithPinnedButtonFactory().createController(handlers: handlers)

        return viewController
    }

    func makeHorizontalStackViewRelativeSizesViewController() -> UIViewController {
        let handlers: HorizontalStackViewResources.Handlers = .init()
        let viewController = HorizontalStackViewFactory().createController(handlers: handlers)

        return viewController
    }

    func makeEyedropperViewController() -> UIViewController {
        let handlers: EyedropperResources.Handlers = .init()
        let viewController = EyedropperFactory().createController(handlers: handlers)

        return viewController
    }

    func makeCustomLayoutViewController() -> UIViewController {
        let handlers: CustomLayoutResources.Handlers = .init()
        let viewController = CustomLayoutFactory().createController(handlers: handlers)

        return viewController
    }

    func makeCompoundViewViewController() -> UIViewController {
        let handlers: CompoundViewResources.Handlers = .init()
        let viewController = CompoundViewFactory().createController(handlers: handlers)

        return viewController
    }

    func makeCircularProgressBarViewController() -> UIViewController {
        let handlers: CircularProgressBarResources.Handlers = .init()
        let viewController = CircularProgressBarFactory().createController(handlers: handlers)

        return viewController
    }
}
