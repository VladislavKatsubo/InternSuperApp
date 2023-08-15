//
//  AsimmetricCollectionView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 14.08.23.
//

import UIKit

final class AsimmetricCollectionView: IView {

    // MARK: - Constants
    private enum Constants {
        static let sectionHeight: CGFloat = 100.0
        static let sectionLeadingTrailingInset: CGFloat = 16.0
        static let sectionTopBottomInset: CGFloat = 8.0

        static let itemInset: CGFloat = 4.0
    }

    private var collectionView: ICollectionView?

    private var models: [AsimmetricCellModel] = []

    // MARK: - Lifecycle
    override func didLoad() {
        super.didLoad()
        setupCollectionView()
    }

    // MARK: - Configure
    func configure(with models: [AsimmetricCellModel]) {
        self.models = models
        self.collectionView?.reloadData()
    }
}

private extension AsimmetricCollectionView {
    // MARK: - Private methods
    func setupCollectionView() {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            return self.createSection(for: sectionIndex)
        }

        collectionView = .init(collectionViewLayout: layout)

        guard let collectionView = collectionView else { return }

        addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.registerCells([
            AsimmetricCollectionCell.self
        ])

        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

extension AsimmetricCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    // MARK: - UICollectionViewDelegate
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        self.models.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let section = models[section]

        switch section {
        case .leadingCell(let models): return models.count
        case .trailingCell(let models): return models.count
        case .plainCell(_): return 1
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = models[indexPath.section]

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: AsimmetricCollectionCell.reuseID,
            for: indexPath
        ) as? AsimmetricCollectionCell else {
            return .init()
        }

        switch sectionType {
        case .leadingCell(let models):
            cell.configure(with: models[indexPath.item])
            return cell
        case .trailingCell(let models):
            cell.configure(with: models.reversed()[indexPath.item])
            return cell
        case .plainCell(let model):
            cell.configure(with: model)
            return cell
        }
    }
}

private extension AsimmetricCollectionView {
    // MARK: - Sections setup
    func createSection(for sectionIndex: Int) -> NSCollectionLayoutSection {
        let section = models[sectionIndex]

        switch section {
        case .leadingCell(_): return createSectionLayout(for: .leading)
        case .trailingCell(_): return createSectionLayout(for: .trailing)
        case .plainCell(_): return createPlainSectionLayout()
        }
    }

    // MARK: Plain section
    func createPlainSectionLayout() -> NSCollectionLayoutSection {
        let plainItemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )

        let plainItem = NSCollectionLayoutItem(
            layoutSize: plainItemSize
        )

        plainItem.contentInsets = .init(
            top: Constants.itemInset,
            leading: Constants.itemInset,
            bottom: Constants.itemInset,
            trailing: Constants.itemInset
        )

        let plainGroupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(Constants.sectionHeight)
        )

        let plainGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: plainGroupSize,
            subitem: plainItem,
            count: 1
        )

        let section = NSCollectionLayoutSection(group: plainGroup)

        section.contentInsets = .init(
            top: Constants.sectionTopBottomInset,
            leading: Constants.sectionLeadingTrailingInset,
            bottom: Constants.sectionTopBottomInset,
            trailing: Constants.sectionLeadingTrailingInset
        )

        return section
    }

    // MARK: Asimmetric Section Layout Builder
    func createSectionLayout(for type: SectionAlignmentType) -> NSCollectionLayoutSection {

        var leadingGroupSizeMultiplier: CGFloat = 0.0
        var trailingGroupSizeWidthMultiplier: CGFloat = 0.0

        switch type {
        case .leading:
            leadingGroupSizeMultiplier = 0.3
            trailingGroupSizeWidthMultiplier = 0.7
        case .trailing:
            leadingGroupSizeMultiplier = 0.7
            trailingGroupSizeWidthMultiplier = 0.3
        }

        // MARK: Leading Item
        let leadingItemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )

        let leadingItem = NSCollectionLayoutItem(
            layoutSize: leadingItemSize
        )

        leadingItem.contentInsets = .init(
            top: Constants.itemInset,
            leading: Constants.itemInset,
            bottom: Constants.itemInset,
            trailing: Constants.itemInset
        )

        let leadingGroupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(leadingGroupSizeMultiplier),
            heightDimension: .fractionalHeight(1.0)
        )

        // MARK: Trailing Item
        let trailingItemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )

        let trailingItem = NSCollectionLayoutItem(
            layoutSize: trailingItemSize
        )

        trailingItem.contentInsets = .init(
            top: Constants.itemInset,
            leading: Constants.itemInset,
            bottom: Constants.itemInset,
            trailing: Constants.itemInset
        )

        let trailingGroupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(trailingGroupSizeWidthMultiplier),
            heightDimension: .fractionalHeight(1.0)
        )

        // MARK: Groups
        let leadingGroup: NSCollectionLayoutGroup
        let trailingGroup: NSCollectionLayoutGroup
        if type == .leading {
            leadingGroup = NSCollectionLayoutGroup.vertical(layoutSize: leadingGroupSize, subitem: leadingItem, count: 2)
            trailingGroup = NSCollectionLayoutGroup.horizontal(layoutSize: trailingGroupSize, subitem: trailingItem, count: 1)
        } else {
            leadingGroup = NSCollectionLayoutGroup.horizontal(layoutSize: leadingGroupSize, subitem: leadingItem, count: 1)
            trailingGroup = NSCollectionLayoutGroup.vertical(layoutSize: trailingGroupSize, subitem: trailingItem, count: 2)
        }

        let containerGroupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(Constants.sectionHeight)
        )

        let containerGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: containerGroupSize,
            subitems: [leadingGroup, trailingGroup]
        )

        // MARK: Section
        let section = NSCollectionLayoutSection(group: containerGroup)
        section.contentInsets = .init(
            top: Constants.sectionTopBottomInset,
            leading: Constants.sectionLeadingTrailingInset,
            bottom: Constants.sectionTopBottomInset,
            trailing: Constants.sectionLeadingTrailingInset
        )

        return section
    }

    enum SectionAlignmentType {
        case leading
        case trailing
    }
}
