//
//  ColoredCardCellFactory.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 8.08.23.
//

import UIKit

final class ColoredCardCellFactory {
    func createController(handlers: ColoredCardCellResources.Handlers) -> UIViewController {
        let context: AppContext = AppDelegate.shared.context
        let viewModel = ColoredCardCellViewModel(context: context, handlers: handlers)
        let viewController = ColoredCardCellViewController()

        viewController.configure(viewModel: viewModel)

        return viewController
    }
}
