//
//  AddRemoveFactory.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 2.07.23.
//

import UIKit

final class AddRemoveFactory {
    func createController() -> UIViewController {
        let sesion = URLSession(configuration: .default)
        let networkManager = NetworkManager(session: sesion)
        let imageManager = ImageManager(networkManager: networkManager)
        let viewModel = AddRemoveViewModel(imageManager: imageManager)
        let viewController = AddRemoveViewController()

        viewController.configure(with: viewModel)

        return viewController
    }
}

