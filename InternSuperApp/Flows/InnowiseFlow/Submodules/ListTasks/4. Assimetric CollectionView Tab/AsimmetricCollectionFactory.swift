//
//  AsimmetricCollectionFactory.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 14.08.23.
//

import UIKit

final class AsimmetricCollectionFactory {
    func createController(handlers: AsimmetricCollectionResources.Handlers) -> UIViewController {
        let context: AppContext = AppDelegate.shared.context
        let viewModel = AsimmetricCollectionViewModel(context: context, handlers: handlers)
        let viewController = AsimmetricCollectionViewController()

        viewController.configure(viewModel: viewModel)

        return viewController
    }
}
