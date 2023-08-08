//
//  TwoLineFactory.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 2.08.23.
//

import UIKit

final class TwoLineFactory {
    func createController(handlers: TwoLineResources.Handlers) -> UIViewController {
        let context: AppContext = AppDelegate.shared.context
        let viewModel = TwoLineViewModel(context: context, handlers: handlers)
        let viewController = TwoLineViewController()

        viewController.configure(viewModel: viewModel)

        return viewController
    }
}
