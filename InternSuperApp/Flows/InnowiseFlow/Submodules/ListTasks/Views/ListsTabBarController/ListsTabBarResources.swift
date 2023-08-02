//
//  ListsTabBarResources.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 29.07.23.
//

import UIKit

struct ListsTabBarResources {
    struct ItemController {
        var usersTableView: UIViewController?
        var usersCollectionView: UIViewController?
        var twoColumnUsersCollectionView: UIViewController?
        var variousCellsTableView: UIViewController?
        var mockLoadingTableView: UIViewController?
    }

    struct Handlers {
        var controllers: () -> ItemController
    }

    enum Constants {
        static let imageInsets: UIEdgeInsets = .init(top: 7.0, left: 0.0, bottom: -7.0, right: 0.0)
    }
}
