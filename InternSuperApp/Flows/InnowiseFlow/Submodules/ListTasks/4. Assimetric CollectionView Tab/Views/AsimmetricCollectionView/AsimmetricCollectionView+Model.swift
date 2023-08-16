//
//  AsimmetricCollectionView+Model.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 14.08.23.
//

import Foundation

extension AsimmetricCollectionView {
    enum AsimmetricCellModel {
        case leadingCell([AsimmetricCollectionCell.Model])
        case trailingCell([AsimmetricCollectionCell.Model])
        case plainCell(AsimmetricCollectionCell.Model)
    }
}
