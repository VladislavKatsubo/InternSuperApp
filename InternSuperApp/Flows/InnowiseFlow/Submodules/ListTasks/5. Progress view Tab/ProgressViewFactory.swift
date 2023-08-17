//
//  ProgressViewFactory.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 15.08.23.
//

import UIKit

final class ProgressViewFactory {
    func createController(handlers: ProgressViewResources.Handlers) -> UIViewController {
        let context: AppContext = AppDelegate.shared.context
        let imageManager = ServiceFactory.createImageManager()
        let viewModel = ProgressViewViewModel(context: context, handlers: handlers, imageManager: imageManager)
        let viewController = ProgressViewViewController()

        viewController.configure(viewModel: viewModel)

        return viewController
    }
}
