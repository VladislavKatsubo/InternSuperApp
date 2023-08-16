//
//  UpdateCounterFactory.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 16.08.23.
//

import UIKit

final class UpdateCounterFactory {
    func createController(handlers: UpdateCounterResources.Handlers) -> UIViewController {
        let context: AppContext = AppDelegate.shared.context
        let viewModel = UpdateCounterViewModel(context: context, handlers: handlers)
        let viewController = UpdateCounterViewController()

        viewController.configure(viewModel: viewModel)

        return viewController
    }
}
