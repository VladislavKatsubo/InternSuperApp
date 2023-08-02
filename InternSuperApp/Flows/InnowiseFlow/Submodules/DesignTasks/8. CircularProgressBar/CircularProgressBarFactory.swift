//
//  CircularProgressBarFactory.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 7.07.23.
//

import UIKit

final class CircularProgressBarFactory {
    func createController(handlers: CircularProgressBarResources.Handlers) -> UIViewController {
        let viewModel = CircularProgressBarViewModel(handlers: handlers)
        let viewController = CircularProgressBarViewController()
        viewController.configure(with: viewModel)

        return viewController
    }
}
