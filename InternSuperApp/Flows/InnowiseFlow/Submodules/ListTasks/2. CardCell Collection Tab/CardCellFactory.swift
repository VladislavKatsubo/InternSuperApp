//
//  CardCellFactory.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 7.08.23.
//

import UIKit

final class CardCellFactory {
    func createController(handlers: CardCellResources.Handlers) -> UIViewController {
        let context: AppContext = AppDelegate.shared.context
        let imageManager = ServiceFactory.createImageManager()
        let viewModel = CardCellViewModel(context: context, handlers: handlers, imageManager: imageManager)
        let viewController = CardCellViewController()

        viewController.configure(viewModel: viewModel)

        return viewController
    }
}
