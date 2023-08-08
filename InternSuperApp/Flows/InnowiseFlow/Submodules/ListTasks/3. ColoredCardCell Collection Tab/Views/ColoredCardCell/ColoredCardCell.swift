//
//  ColoredCardCell.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 8.08.23.
//

import UIKit

final class ColoredCardCell: ICollectionCell {

    private enum Constants {
        static let labelFont: UIFont = .systemFont(ofSize: 18.0, weight: .semibold)
        static let labelFontColor: UIColor = .black

        static let categoryNameLabelOffset: CGFloat = 10.0
        static let categoryNameLabelInset: CGFloat = -10.0

        static let categoryIconImageViewSize: CGSize = .init(width: 90.0, height: 90.0)
        static let categoryIconImageViewOffset: CGFloat = 10.0
        static let categoryIconImageViewAlpha: CGFloat = 0.33

        static let cornerRadius: CGFloat = 10.0
    }

    private let categoryIconImageView = IImageView()
    private let categoryNameLabel = UILabel()

    // MARK: - Lifecycle
    override func didLoad() {
        setupItems()
    }

    // MARK: - Configure
    func configure(with model: Model) {
        self.backgroundColor = model.backgroundColor
        self.categoryNameLabel.text = model.categoryName
        self.categoryIconImageView.image = model.categoryIcon
    }
}

private extension ColoredCardCell {
    // MARK: - Private methods
    func setupItems() {
        self.layer.cornerRadius = Constants.cornerRadius

        setupCategoryLabel()
        setupCategoryIconImageView()
    }

    func setupCategoryLabel() {
        addSubview(categoryNameLabel)
        categoryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryNameLabel.font = Constants.labelFont
        categoryNameLabel.textColor = Constants.labelFontColor

        NSLayoutConstraint.activate([
            categoryNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.categoryNameLabelOffset),
            categoryNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            categoryNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.categoryNameLabelInset),
        ])
    }

    func setupCategoryIconImageView() {
        addSubview(categoryIconImageView)
        categoryIconImageView.translatesAutoresizingMaskIntoConstraints = false
        categoryIconImageView.alpha = Constants.categoryIconImageViewAlpha

        NSLayoutConstraint.activate([
            categoryIconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.categoryIconImageViewOffset),
            categoryIconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            categoryIconImageView.widthAnchor.constraint(equalToConstant: Constants.categoryIconImageViewSize.width),
            categoryIconImageView.heightAnchor.constraint(equalToConstant: Constants.categoryIconImageViewSize.height)
        ])
    }
}
