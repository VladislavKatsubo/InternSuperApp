//
//  EyedropperFactory.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 23.07.23.
//

import UIKit

final class EyedropperFactory {
    func createController(handlers: EyedropperResources.Handlers) -> UIViewController {
        let viewController = EyedropperViewController()

        return viewController
    }
}
