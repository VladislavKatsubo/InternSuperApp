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
        let imageManager = ServiceFactory.createImageManager()
        let viewModel = TwoLineViewModel(context: context, handlers: handlers, imageManager: imageManager)
        let viewController = TwoLineViewController()

        viewController.configure(viewModel: viewModel)

        return viewController
    }
}
