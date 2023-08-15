//
//  CenteredViewFactory.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 23.07.23.
//

import UIKit

final class CenteredViewFactory {
    func createController(handlers: CenteredViewResources.Handlers) -> UIViewController {
        let viewController = CenteredViewController()

        return viewController
    }
}
