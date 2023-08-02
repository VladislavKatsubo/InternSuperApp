//
//  ScrollViewWithPinnedButtonFactory.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 23.07.23.
//

import UIKit

final class ScrollViewWithPinnedButtonFactory {
    func createController(handlers: ScrollViewWithPinnedButtonResources.Handlers) -> UIViewController {
        let viewController = ScrollViewWithPinnedButtonViewController()

        return viewController
    }
}
