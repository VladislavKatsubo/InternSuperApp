//
//  HideShowFactory.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 28.06.23.
//

import UIKit

final class HideShowFactory {
    func createController() -> UIViewController {
        let sesion = URLSession(configuration: .default)
        let networkManager = NetworkManager(session: sesion)
        let imageManager = ImageManager(networkManager: networkManager)
        let viewModel = HideShowViewModel(imageManager: imageManager)
        let viewController = HideShowViewController()

        viewController.configure(with: viewModel)

        return viewController
    }
}
