//
//  CardCollectionViewCell.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 7.08.23.
//

import UIKit

final class CardCollectionViewCell: ICollectionCell {

    private enum Constants {

    }

    // MARK: - Lifecycle
    override func didLoad() {
        setupItems()
    }

    private let containerView = IView()
    private let avatarImageView = AvatarImageView()
    private let verticalStackView = IStackView(axis: .vertical)
    private let nameLabel = UILabel()
    private let ageLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let sexIconLabel = UILabel()

    private var viewModel: CardCollectionViewCellViewModelProtocol?

    // MARK: - Configure
    func configure(with model: Model, viewModel: CardCollectionViewCellViewModelProtocol) {
        self.viewModel = viewModel
        self.setupViewModel()
    }
}

private extension CardCollectionViewCell {
    // MARK: - Private methods
    func setupViewModel() {

    }

    func setupItems() {

    }
}
