//
//  ListsTabBarViewModel.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 29.07.23.
//

import UIKit

final class ListsTabBarViewModel {

    typealias Constants = ListsTabBarResources.Constants

    private let handlers: ListsTabBarResources.Handlers

    // MARK: - Initializator
    init(handlers: ListsTabBarResources.Handlers) {
        self.handlers = handlers
    }

    // MARK: - Public methods
    func controllers() -> [UINavigationController] {
        let items = handlers.controllers()
        var controllers: [UINavigationController] = []

        if let usersTableViewController = items.usersTableView {
            let usersTableView = UINavigationController(rootViewController: usersTableViewController)
            usersTableView.tabBarItem = UITabBarItem(
                title: nil,
                image: UIImage(systemName: "sun.min"),
                selectedImage: UIImage(systemName: "sun.min.fill")
            )
            usersTableView.tabBarItem.imageInsets = Constants.imageInsets
            controllers.append(usersTableView)
        }
        
        if let usersCollectionViewController = items.usersCollectionView {
            let usersCollectionView = UINavigationController(rootViewController: usersCollectionViewController)
            usersCollectionView.tabBarItem = UITabBarItem(
                title: nil,
                image: UIImage(systemName: "sun.min"),
                selectedImage: UIImage(systemName: "sun.min.fill")
            )
            usersCollectionView.tabBarItem.imageInsets = Constants.imageInsets
            controllers.append(usersCollectionView)
        }

        if let twoColumnUsersCollectionViewController = items.twoColumnUsersCollectionView {
            let twoColumnUsersCollectionView = UINavigationController(rootViewController: twoColumnUsersCollectionViewController)
            twoColumnUsersCollectionView.tabBarItem = UITabBarItem(
                title: nil,
                image: UIImage(systemName: "sun.min"),
                selectedImage: UIImage(systemName: "sun.min.fill")
            )
            twoColumnUsersCollectionView.tabBarItem.imageInsets = Constants.imageInsets
            controllers.append(twoColumnUsersCollectionView)
        }

        if let variousCellsTableViewController = items.variousCellsTableView {
            let variousCellsTableView = UINavigationController(rootViewController: variousCellsTableViewController)
            variousCellsTableView.tabBarItem = UITabBarItem(
                title: nil,
                image: UIImage(systemName: "sun.min"),
                selectedImage: UIImage(systemName: "sun.min.fill")
            )
            variousCellsTableView.tabBarItem.imageInsets = Constants.imageInsets
            controllers.append(variousCellsTableView)
        }

        if let mockLoadingTableViewController = items.mockLoadingTableView {
            let mockLoadingTableView = UINavigationController(rootViewController: mockLoadingTableViewController)
            mockLoadingTableView.tabBarItem = UITabBarItem(
                title: nil,
                image: UIImage(systemName: "sun.min"),
                selectedImage: UIImage(systemName: "sun.min.fill")
            )
            mockLoadingTableView.tabBarItem.imageInsets = Constants.imageInsets
            controllers.append(mockLoadingTableView)
        }

        return controllers
    }
}

