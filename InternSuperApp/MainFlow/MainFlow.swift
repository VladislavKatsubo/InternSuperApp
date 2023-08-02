//
//  MainFlow.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 20.07.23.
//

import UIKit

final class MainFlow {
    private struct TabBarItemFlows {
        let innowiseFlow: InnowiseFlow?
        let takeHomeTestTasksFlow: TakeHomeTestsFlow?
    }

    private var itemFlows: TabBarItemFlows = TabBarItemFlows(innowiseFlow: nil, takeHomeTestTasksFlow: nil)
    private var innowiseFlow: InnowiseFlow?

    private(set) var navigator: MainFlowNavigatorProtocol

    // MARK: - Init
    init(navigator: MainFlowNavigatorProtocol) {
        self.navigator = navigator
    }

    // MARK: - Public methods
    func makeStartFlow(with window: UIWindow?) -> Bool {
        guard let window = window else { return false }

        window.rootViewController = makeLaunchScreen()
        window.makeKeyAndVisible()

        goInnowiseFlow()

        return true
    }
}

extension MainFlow {
    // MARK: - Flows
    func makeInnowiseFlow() -> UIViewController {
        innowiseFlow = InnowiseFlow(navigator: InnowiseFlowNavigator())
        guard let vc = innowiseFlow?.makeStartFlow() else { return .init() }

        return vc
    }
}
