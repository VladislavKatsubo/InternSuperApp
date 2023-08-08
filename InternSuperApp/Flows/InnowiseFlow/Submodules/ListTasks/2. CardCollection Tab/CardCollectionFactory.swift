//
//  CardCollectionFactory.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 7.08.23.
//

import UIKit

final class CardCollectionFactory {
    func createController(handlers: CardCollectionResources.Handlers) -> UIViewController {
        let context: AppContext = AppDelegate.shared.context
        let viewModel = CardCollectionViewModel(context: context, handlers: handlers)
        let viewController = CardCollectionViewController()

        viewController.configure(viewModel: viewModel)

        return viewController
    }
}
