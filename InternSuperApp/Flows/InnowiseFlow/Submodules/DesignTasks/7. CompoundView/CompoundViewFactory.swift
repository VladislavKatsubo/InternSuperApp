//
//  CompoundViewFactory.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 5.07.23.
//

import UIKit

final class CompoundViewFactory {
    func createController(handlers: CompoundViewResources.Handlers) -> UIViewController {
        let viewModel = CompoundViewViewModel(handlers: handlers)
        let viewController = CompoundViewViewController()
        viewController.configure(with: viewModel)

        return viewController
    }
}
