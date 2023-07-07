//
//  CircularProgressBarFactory.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 7.07.23.
//

import UIKit

final class CircularProgressBarFactory {
    func createController() -> UIViewController {
        let viewModel = CircularProgressBarViewModel()
        let viewController = CircularProgressBarViewController()
        viewController.configure(with: viewModel)

        return viewController
    }
}
