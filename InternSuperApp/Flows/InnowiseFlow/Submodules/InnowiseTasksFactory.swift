//
//  InnowiseTasksFactory.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 23.07.23.
//

import UIKit

final class InnowiseTasksFactory {
    func createController(designHandlers: InnowiseTasksResources.Handlers.Design, listHandlers: InnowiseTasksResources.Handlers.Lists) -> UIViewController {
        let context: AppContext = AppDelegate.shared.context
        let viewModel = InnowiseTasksViewModel(context: context, designHandlers: designHandlers, listHandlers: listHandlers)
        let viewController = InnowiseTasksViewController()

        viewController.configure(viewModel: viewModel)

        return viewController
    }
}
