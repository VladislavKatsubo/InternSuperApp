//
//  AsimmetricCollectionResources.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 14.08.23.
//

import UIKit

struct AsimmetricCollectionResources {
    // MARK: - Handlers
    struct Handlers {

    }

    // MARK: - States
    enum State {
        case onCollectionViewData([AsimmetricCollectionView.AsimmetricCellModel])
    }

    // MARK: - Constants
    enum Constants {

        enum UI {

        }

        enum Mocks {
            static let asimmetricCellColors: [UIColor] = [
                UIColor(hexString: "5995ED"),
                UIColor(hexString: "F9ADA0"),
                UIColor(hexString: "55917F")
            ]

            static let assimmetricCellModels: [AsimmetricCollectionCell.Model] = asimmetricCellColors.map({
                .init(backgroundColor: $0)
            })

            static let models: [AsimmetricCollectionView.AsimmetricCellModel] = [
                .trailingCell(assimmetricCellModels),
                .plainCell(.init(
                    backgroundColor: UIColor(hexString: "13262F"))
                ),
                .leadingCell(assimmetricCellModels),
                .plainCell(.init(
                    backgroundColor: UIColor(hexString: "13262F"))
                ),
            ]

            static let allModels: [AsimmetricCollectionView.AsimmetricCellModel] = Array(
                repeating: models, count: 10
            ).flatMap { $0 }
        }
    }
}
