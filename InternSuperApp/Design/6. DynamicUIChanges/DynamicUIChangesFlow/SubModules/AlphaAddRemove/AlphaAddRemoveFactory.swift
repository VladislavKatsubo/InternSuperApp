//
//  AlphaAddRemoveFactory.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 5.07.23.
//

import UIKit

final class AlphaAddRemoveFactory {
    func createController() -> UIViewController {
        let sesion = URLSession(configuration: .default)
        let networkManager = NetworkManager(session: sesion)
        let imageManager = ImageManager(networkManager: networkManager)
        let viewModel = AlphaAddRemoveViewModel(imageManager: imageManager)
        let viewController = AlphaAddRemoveViewController()

        viewController.configure(with: viewModel)

        return viewController
    }
}
