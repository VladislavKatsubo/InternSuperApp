//
//  CustomLayoutFactory.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 22.06.23.
//

import UIKit

final class CustomLayoutFactory {
    func createController(handlers: CustomLayoutResources.Handlers) -> UIViewController {
        let viewModel = CustomLayoutViewModel(handlers: handlers)
        let viewController = CustomLayoutViewController()
        viewController.configure(with: viewModel)

        return viewController
    }
}
