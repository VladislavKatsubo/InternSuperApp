//
//  ColoredCardCellCollectionView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 8.08.23.
//

import UIKit

final class ColoredCardCellCollectionView: IView {

    private enum Constants {
        static let numberOfItems: Int = 20
        static let cellHeight: CGFloat = 100.0
        static let lineSpacing: CGFloat = 0.0
        static let padding: CGFloat = 16.0
        static let numberOfColumns: CGFloat = 2
    }

    private var collectionView: ICollectionView?
    private var models: [ColoredCardCell.Model] = []

    // MARK: - Lifecycle
    override func didLoad() {
        backgroundColor = .systemGroupedBackground
        setupCollectionView()
    }

    // MARK: - Configure
    func configure(with models: [ColoredCardCell.Model]) {
        self.models = models
    }
}

private extension ColoredCardCellCollectionView {
    // MARK: - Private methods
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(
            top: Constants.padding,
            left: Constants.padding,
            bottom: Constants.padding,
            right: Constants.padding
        )


        let collectionView = ICollectionView(collectionViewLayout: layout)
        collectionView.registerCells([ColoredCardCell.self])
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = true
        collectionView.isPagingEnabled = false
        collectionView.dataSource = self
        collectionView.delegate = self

        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])

        self.collectionView = collectionView
    }
}

extension ColoredCardCellCollectionView: UICollectionViewDataSource {
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Constants.numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ColoredCardCell.reuseID, for: indexPath
        ) as? ColoredCardCell else {
            return .init()
        }

        let model = models[indexPath.row % models.count]

        cell.configure(with: model)
        return cell
    }
}

extension ColoredCardCellCollectionView: UICollectionViewDelegateFlowLayout {
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpacing = (2 * Constants.padding) + ((Constants.numberOfColumns - 1) * Constants.padding)
        let width = (collectionView.bounds.width - totalSpacing) / Constants.numberOfColumns
        return CGSize(width: width, height: Constants.cellHeight)
    }
}
