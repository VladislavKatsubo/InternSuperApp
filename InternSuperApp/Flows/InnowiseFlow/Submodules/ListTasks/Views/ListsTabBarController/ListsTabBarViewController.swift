//
//  ListsTabBarViewController.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 29.07.23.
//

import UIKit

final class ListsTabBarViewController: UITabBarController {

    private enum Constants {
        static let shadowOpacity: Float = 0.1
        static let shadowRadius: CGFloat = 3.0
    }

    private var viewModel: ListsTabBarViewModel?

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = Constants.shadowOpacity
        tabBar.layer.shadowOffset = .zero
        tabBar.layer.shadowRadius = Constants.shadowRadius
        tabBar.clipsToBounds = false
        tabBar.backgroundColor = UIColor.white

        navigationItem.largeTitleDisplayMode = .never
    }

    // MARK: - Configure

    func configure(viewModel: ListsTabBarViewModel) {
        self.viewModel = viewModel

        let controllers = viewModel.controllers()
        self.setViewControllers(controllers, animated: false)
    }
}
