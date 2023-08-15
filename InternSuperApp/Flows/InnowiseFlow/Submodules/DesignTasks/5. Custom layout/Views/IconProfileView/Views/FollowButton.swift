//
//  FollowButton.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 22.06.23.
//

import UIKit

final class FollowButton: IButton {

    // MARK: - Constants
    private enum Constants {
        static let gradientStartColor: UIColor = UIColor.init(red: 230/255, green: 115/255, blue: 55/255, alpha: 1.0)
        static let gradientEndColor: UIColor = UIColor.init(red: 255/255, green: 90/255, blue: 101/255, alpha: 1.0)

        static let buttonLabelFontSize: CGFloat = 18.0

        static let buttonTitle: String = "+ Follow"
    }

    private let gradientLayer = CAGradientLayer()

    // MARK: - Lifecycle
    override func didLoad() {
        super.didLoad()
        setupItems()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        self.layer.cornerRadius = bounds.height / 2
    }
}

private extension FollowButton {
    // MARK: - Private methods
    func setupItems() {
        setupButton()
        setupGradientLayer()
    }

    func setupButton() {
        self.title = Constants.buttonTitle
        self.titleColor = .white
        self.titleLabel?.font = .systemFont(ofSize: Constants.buttonLabelFontSize, weight: .regular)
        self.clipsToBounds = true
    }

    func setupGradientLayer() {
        gradientLayer.colors = [Constants.gradientStartColor.cgColor, Constants.gradientEndColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
