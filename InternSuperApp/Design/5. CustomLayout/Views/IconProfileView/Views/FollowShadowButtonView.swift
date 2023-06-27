//
//  FollowShadowButtonView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 23.06.23.
//

import UIKit

final class FollowShadowButtonView: IView {

    private enum Constants {
        static let gradientEndColor: UIColor = UIColor.init(red: 255/255, green: 90/255, blue: 101/255, alpha: 1.0)

        static let layerShadowOpacity: Float = 1.0
        static let layerShadowRadius: CGFloat = 10.0
        static let layerShadowOffset: CGSize = CGSize(width: 0, height: 2)
    }

    private let roundedGradientButton = FollowButton()

    // MARK: - Lifecycle
    override func didLoad() {
        setupItems()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupShadowLayer()
    }
}

private extension FollowShadowButtonView {
    // MARK: - Private methods
    func setupItems() {
        setupButton()
        setupShadowLayer()
    }

    func setupButton() {
        addSubview(roundedGradientButton)
        roundedGradientButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            roundedGradientButton.topAnchor.constraint(equalTo: topAnchor),
            roundedGradientButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            roundedGradientButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            roundedGradientButton.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    func setupShadowLayer() {
        let shadowPath = UIBezierPath(
            roundedRect: CGRect(
                x: bounds.width * 0.1,
                y: 0,
                width: bounds.width * 0.8,
                height: bounds.height
            ),
            cornerRadius: bounds.height / 2
        )

        layer.shadowColor = Constants.gradientEndColor.cgColor
        layer.shadowOpacity = Constants.layerShadowOpacity
        layer.shadowRadius = Constants.layerShadowRadius
        layer.shadowOffset = Constants.layerShadowOffset

        layer.shadowPath = shadowPath.cgPath
    }
}
