//
//  GradientTitleView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 22.06.23.
//

import UIKit

final class GradientTitleView: IView {

    private enum Constants {
        static let titleLabelFontSize: CGFloat = 26.0
        static let titleLabelFont: UIFont = .systemFont(ofSize: titleLabelFontSize, weight: .regular)
        static let titleLabelTextColor: UIColor = .white
        static let titleLabelNumberOfLines: Int = 3
    }

    private let titleLabel = UILabel()
    private let gradientLayer = CAGradientLayer()

    // MARK: - Lifecycle
    override func didLoad() {
        setupItems()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
    }

    // MARK: - Configure
    func configure(with text: String) {
        self.titleLabel.text = text
    }
}

private extension GradientTitleView {
    // MARK: - Private methods
    func setupItems() {
        setupLabel()
        setupGradientLayer()
    }


    func setupLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.font = Constants.titleLabelFont
        titleLabel.textColor = Constants.titleLabelTextColor
        titleLabel.numberOfLines = Constants.titleLabelNumberOfLines

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    func setupGradientLayer() {
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.black.cgColor
        ]
        gradientLayer.locations = [0.0, 1.0]
        layer.insertSublayer(gradientLayer, at: 0)
    }

//    func setupGradientLayer() {
//        gradientLayer.colors = [
//            UIColor.clear.cgColor,
//            UIColor.black.withAlphaComponent(0.2).cgColor,
//            UIColor.black.withAlphaComponent(0.3).cgColor,
//            UIColor.black.withAlphaComponent(0.4).cgColor,
//            UIColor.black.withAlphaComponent(0.5).cgColor,
//            UIColor.black.withAlphaComponent(0.6).cgColor,
//            UIColor.black.withAlphaComponent(0.7).cgColor,
//            UIColor.black.withAlphaComponent(0.6).cgColor,
//            UIColor.black.withAlphaComponent(0.5).cgColor,
//            UIColor.black.withAlphaComponent(0.4).cgColor,
//            UIColor.black.withAlphaComponent(0.3).cgColor,
//            UIColor.black.withAlphaComponent(0.2).cgColor,
//            UIColor.clear.cgColor
//        ]
//        gradientLayer.locations = [0.0, 0.075, 0.15, 0.225, 0.3, 0.375, 0.45, 0.525, 0.6, 0.675, 0.75, 0.825, 0.9, 1.0]
//        layer.insertSublayer(gradientLayer, at: 0)
//    }
}
