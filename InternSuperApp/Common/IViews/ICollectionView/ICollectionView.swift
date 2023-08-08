//
//  ICollectionView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 7.08.23.
//

import UIKit

class ICollectionView: UICollectionView {

    // MARK: - Constants
    private enum Constants {

    }

    // MARK: - Init
    init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: layout)
        setupItems()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods
    func registerCells(_ cells: [ICollectionCell.Type]) {
        cells.forEach({ register($0, forCellWithReuseIdentifier: $0.reuseID) })
    }
}

private extension ICollectionView {
    // MARK: - Private methods
    func setupItems() {
        backgroundColor = .clear
    }
}
