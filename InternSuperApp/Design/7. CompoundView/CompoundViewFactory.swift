//
//  CompoundViewFactory.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 5.07.23.
//

import UIKit

final class CompoundViewFactory {
    func createController() -> UIViewController {
        let viewModel = CompoundViewViewModel()
        let viewController = CompoundViewViewController()
        viewController.configure(with: viewModel)

        return viewController
    }
}
