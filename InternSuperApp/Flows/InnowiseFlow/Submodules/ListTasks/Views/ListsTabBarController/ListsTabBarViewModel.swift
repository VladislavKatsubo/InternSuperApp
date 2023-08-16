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

        if let usersTableView = items.usersTableView {
            let usersTableViewController = UINavigationController(rootViewController: usersTableView)
            usersTableViewController.tabBarItem = UITabBarItem(
                title: "Two-Line",
                image: UIImage(systemName: "list.bullet.rectangle.portrait"),
                selectedImage: UIImage(systemName: "list.bullet.rectangle.portrait.fill")
            )
            usersTableViewController.tabBarItem.imageInsets = Constants.imageInsets
            controllers.append(usersTableViewController)
        }
        
        if let usersCardCollectionView = items.usersCardCollectionView {
            let usersCollectionViewController = UINavigationController(rootViewController: usersCardCollectionView)
            usersCollectionViewController.tabBarItem = UITabBarItem(
                title: "Card",
                image: UIImage(systemName: "list.bullet.rectangle"),
                selectedImage: UIImage(systemName: "list.bullet.rectangle.fill")
            )
            usersCollectionViewController.tabBarItem.imageInsets = Constants.imageInsets
            controllers.append(usersCollectionViewController)
        }

        if let groceryCollectionView = items.groceryCollectionView {
            let groceryCollectionViewController = UINavigationController(rootViewController: groceryCollectionView)
            groceryCollectionViewController.tabBarItem = UITabBarItem(
                title: "Collection",
                image: UIImage(systemName: "fish"),
                selectedImage: UIImage(systemName: "fish.fill")
            )
            groceryCollectionViewController.tabBarItem.imageInsets = Constants.imageInsets
            controllers.append(groceryCollectionViewController)
        }

        if let asimmetricCollectionView = items.asimmetricCollectionView {
            let asimmetricCollectionViewController = UINavigationController(rootViewController: asimmetricCollectionView)
            asimmetricCollectionViewController.tabBarItem = UITabBarItem(
                title: "Composition",
                image: UIImage(systemName: "align.horizontal.left"),
                selectedImage: UIImage(systemName: "align.horizontal.right.fill")
            )
            asimmetricCollectionViewController.tabBarItem.imageInsets = Constants.imageInsets
            controllers.append(asimmetricCollectionViewController)
        }

        if let progressView = items.progressView {
            let progressViewController = UINavigationController(rootViewController: progressView)
            progressViewController.tabBarItem = UITabBarItem(
                title: "Progress",
                image: UIImage(systemName: "arrow.triangle.2.circlepath.circle"),
                selectedImage: UIImage(systemName: "arrow.triangle.2.circlepath.circle.fill")
            )
            progressViewController.tabBarItem.imageInsets = Constants.imageInsets
            controllers.append(progressViewController)
        }

        return controllers
    }
}

