//
//  ListsTabBarFactory.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 29.07.23.
//

import UIKit

final class ListsTabBarFactory {
    func makeController(handlers: ListsTabBarResources.Handlers) -> UITabBarController {
        let viewModel = ListsTabBarViewModel(handlers: handlers)
        let viewController = ListsTabBarViewController()

        viewController.configure(viewModel: viewModel)

        return viewController
    }
}
