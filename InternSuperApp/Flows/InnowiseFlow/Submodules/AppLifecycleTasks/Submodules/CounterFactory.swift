//
//  CounterFactory.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 16.08.23.
//

import UIKit

final class CounterFactory {
    func createController(handlers: CounterResources.Handlers) -> UIViewController {
        let context: AppContext = AppDelegate.shared.context
        let viewModel = CounterViewModel(context: context, handlers: handlers)
        let viewController = CounterViewController()

        viewController.configure(viewModel: viewModel)

        return viewController
    }
}
