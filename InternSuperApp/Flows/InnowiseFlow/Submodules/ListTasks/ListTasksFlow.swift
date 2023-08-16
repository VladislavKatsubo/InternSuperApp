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

        let cardCollectionViewHandlers = CardCellResources.Handlers.init()
        let cardCollectionViewController = CardCellFactory().createController(handlers: cardCollectionViewHandlers)

        let coloredCardCollectionViewHandlers = ColoredCardCellResources.Handlers.init()
        let coloredCardCollectionViewController = ColoredCardCellFactory().createController(handlers: coloredCardCollectionViewHandlers)

        let asimmetricCollectionViewHandlers = AsimmetricCollectionResources.Handlers.init()
        let asimmetricCollectionViewController = AsimmetricCollectionFactory().createController(handlers: asimmetricCollectionViewHandlers)

        let progressViewHandlers = ProgressViewResources.Handlers.init()
        let progressViewController = ProgressViewFactory().createController(handlers: progressViewHandlers)

        let items = ListsTabBarResources.ItemController(

            usersTableView: twoLineViewController,
            usersCardCollectionView: cardCollectionViewController,
            groceryCollectionView: coloredCardCollectionViewController,
            asimmetricCollectionView: asimmetricCollectionViewController,
            progressView: progressViewController
        )


        let handlers = ListsTabBarResources.Handlers(controllers: { () -> ListsTabBarResources.ItemController in
            return items
        })

        return ListsTabBarFactory().makeController(handlers: handlers)
    }
}
