//
//  DynamicUIChangesFactory.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 28.06.23.
//

import UIKit

final class DynamicUIChangesFactory {
    func createController() -> UIViewController {

//        let viewModel = AlphaAddRemoveViewModel(imageManager: imageManager)
        let viewController = DynamicUIChangesViewController()

//        viewController.configure(with: viewModel)

        return viewController
    }
}
