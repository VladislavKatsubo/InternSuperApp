//
//  DynamicUIChangesFactory.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 28.06.23.
//

import UIKit

final class DynamicUIChangesFactory {
    func createController(handlers: DynamicUIChangesResources.Handlers) -> UIViewController {

        let viewModel = DynamicUIChangesViewModel(handlers: handlers)
        let viewController = DynamicUIChangesViewController()

        viewController.configure(with: viewModel)

        return viewController
    }
}
