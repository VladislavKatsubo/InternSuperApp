//
//  HorizontalStackViewFactory.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 23.07.23.
//

import UIKit

final class HorizontalStackViewFactory {
    func createController(handlers: HorizontalStackViewResources.Handlers) -> UIViewController {
        let viewController = HorizontalStackViewViewController()

        return viewController
    }
}
