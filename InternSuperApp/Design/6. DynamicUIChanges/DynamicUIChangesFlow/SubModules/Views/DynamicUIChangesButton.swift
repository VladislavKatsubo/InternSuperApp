//
//  DynamicUIChangesButton.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 28.06.23.
//

import UIKit

final class DynamicUIChangesButton: IButton {

    private enum Constants {
        static let cornerRadius: CGFloat = 10.0
        static let visualEffectAlpha: CGFloat = 1

        static let labelFont: UIFont = .systemFont(ofSize: 18.0, weight: .regular)
        static let labelFontColor: UIColor = .black
    }

    private let visualEffectView = UIVisualEffectView()
    private let gradientLayer = CAGradientLayer()

    // MARK: - Configure
    func configure(with text: String) {
        self.title = text
    }

    // MARK: - Lifecycle
    override func didLoad() {
        super.didLoad()
        setupItems()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupGradientLayer()
        setupAnimationForGradient()
    }
}

private extension DynamicUIChangesButton {
    // MARK: - Private methods
    func setupItems() {
        setupButton()
        setupVisualEffect()
    }

    func setupButton() {
        self.backgroundColor = .clear

        self.layer.cornerRadius = Constants.cornerRadius
        self.layer.masksToBounds = true

        self.titleLabel?.font = Constants.labelFont
        self.titleColor = Constants.labelFontColor
    }

    func setupVisualEffect() {
        insertSubview(visualEffectView, at: 0)
        visualEffectView.isUserInteractionEnabled = false
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false

        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        visualEffectView.effect = blurEffect

        visualEffectView.layer.cornerRadius = Constants.cornerRadius
        visualEffectView.layer.masksToBounds = true
        visualEffectView.alpha = Constants.visualEffectAlpha

        NSLayoutConstraint.activate([
            visualEffectView.topAnchor.constraint(equalTo: topAnchor),
            visualEffectView.bottomAnchor.constraint(equalTo: bottomAnchor),
            visualEffectView.leadingAnchor.constraint(equalTo: leadingAnchor),
            visualEffectView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    func setupGradientLayer() {
        gradientLayer.frame = bounds
        gradientLayer.colors = [
            UIColor.systemBlue.cgColor,
            UIColor.systemRed.cgColor,
            UIColor.systemGreen.cgColor,
            UIColor.systemRed.cgColor,
            UIColor.systemBlue.cgColor,
        ]

        gradientLayer.locations = [0.0, 0.25, 0.5, 0.75, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        visualEffectView.layer.insertSublayer(gradientLayer, at: 0)
    }

    func setupAnimationForGradient() {
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1.0, -0.5, 0.0, 0.5, 1.0]
        animation.toValue = [1.0, 1.5, 2.0, 2.5, 3.0]
        animation.duration = 10
        animation.repeatCount = .infinity

        gradientLayer.add(animation, forKey: "loadingAnimation")
    }
}
