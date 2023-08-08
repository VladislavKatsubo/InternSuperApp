//
//  ListTasksFlow.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 2.08.23.
//

import UIKit

final class ListTasksFlow {
    private let navigator: ListTasksFlowNavigatorProtocol

    init(navigator: ListTasksFlowNavigatorProtocol) {
        self.navigator = navigator
    }

    func makeTabBarFlow() -> UIViewController {

        let twoLineViewControllerHandlers = TwoLineResources.Handlers.init()
        let twoLineViewController = TwoLineFactory().createController(handlers: twoLineViewControllerHandlers)

        let cardCollectionViewHandlers = CardCollectionResources.Handlers.init()
        let cardCollectionViewController = CardCollectionFactory().createController(handlers: cardCollectionViewHandlers)

        let items = ListsTabBarResources.ItemController(

            usersTableView: twoLineViewController,
            usersCollectionView: cardCollectionViewController,
            twoColumnUsersCollectionView: .init(),
            variousCellsTableView: .init(),
            mockLoadingTableView: .init()
        )


        let handlers = ListsTabBarResources.Handlers(controllers: { () -> ListsTabBarResources.ItemController in
            return items
        })

        return ListsTabBarFactory().makeController(handlers: handlers)
    }
}
