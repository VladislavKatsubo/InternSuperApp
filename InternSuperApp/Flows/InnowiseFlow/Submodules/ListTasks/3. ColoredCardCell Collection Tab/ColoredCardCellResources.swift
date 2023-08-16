//
//  ColoredCardCellResources.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 8.08.23.
//

import UIKit

struct ColoredCardCellResources {
    // MARK: - Handlers
    struct Handlers {

    }

    // MARK: - States
    enum State {
        case onColoredCollectionView([ColoredCardCell.Model])
    }

    // MARK: - Constants
    enum Constants {

        enum UI {
            static let title: String = "Collection"
        }

        enum Mocks {
            static let models: [GroceryCategory] = GroceryCategory.allCases
        }
    }
}
