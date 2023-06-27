//
//  CustomLayoutFactory.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 22.06.23.
//

import UIKit

final class CustomLayoutFactory {
    func createController() -> UIViewController {
        let viewModel = CustomLayoutViewModel()
        let viewController = CustomLayoutViewController()
        viewController.configure(with: viewModel)

        return viewController
    }
}
