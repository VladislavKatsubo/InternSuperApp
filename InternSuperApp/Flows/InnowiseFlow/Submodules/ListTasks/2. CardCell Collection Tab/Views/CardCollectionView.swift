//
//  CardCollectionView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 7.08.23.
//

import UIKit

final class CardCollectionView: IView {

    private enum Constants {
        static let cellHeight: CGFloat = 175.0
    }

    private var collectionView: ICollectionView? = nil
    private var models: [CardCollectionViewCell.Model] = []

    private var imageManager: ImageManagerProtocol?

    // MARK: - Lifecycle
    override func didLoad() {
        backgroundColor = .systemGroupedBackground
        setupCollectionView()
    }

    // MARK: - Configure
    func configure(with models: [CardCollectionViewCell.Model], imageManager: ImageManagerProtocol) {
        self.models = models
        self.imageManager = imageManager
        self.collectionView?.reloadData()
    }
}

private extension CardCollectionView {
    // MARK: - Private methods
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = .zero
        layout.scrollDirection = .vertical

        let collectionView = ICollectionView(collectionViewLayout: layout)
        collectionView.registerCells([CardCollectionViewCell.self])
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

extension CardCollectionView: UICollectionViewDataSource {
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.models.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CardCollectionViewCell.reuseID, for: indexPath
        ) as? CardCollectionViewCell,
              let imageManager = imageManager else {
            return .init()
        }

        let model = models[indexPath.row]
        
        let viewModel = CardCollectionViewCellViewModel(
            model: model,
            imageManager: imageManager
        )
        cell.configure(viewModel: viewModel)
        return cell
    }
}

extension CardCollectionView: UICollectionViewDelegateFlowLayout {
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let size = CGSize(width: width, height: Constants.cellHeight)
        return size
    }
}
