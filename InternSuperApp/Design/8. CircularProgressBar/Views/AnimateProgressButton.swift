//
//  AnimateCircleButton.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 7.07.23.
//

import UIKit

final class AnimateProgressButton: IButton {

    private enum Constants {
        static let titleColor: UIColor = .systemTeal.withAlphaComponent(0.8)

        static let cornerRadius: CGFloat = 20.0
        static let borderWidth: CGFloat = 3.0
        static let borderColor: UIColor = .systemTeal

        static let titleLabelFont: UIFont = .systemFont(ofSize: 16.0, weight: .semibold)
    }

    override var isHighlighted: Bool {
        didSet {
            self.alpha = isHighlighted ? 0.5 : 1.0
        }
    }

    // MARK: - Lifecycle
    override func didLoad() {
        super.didLoad()
        setupItems()
    }

    // MARK: - Configure
    func configure(with text: String) {
        self.title = text
    }
}

private extension AnimateProgressButton {
    // MARK: - Private methods
    func setupItems() {
        self.titleColor = Constants.titleColor
        self.titleLabel?.font = Constants.titleLabelFont

        self.backgroundColor = .clear
        self.layer.cornerRadius = Constants.cornerRadius
        self.layer.borderWidth = Constants.borderWidth
        self.layer.borderColor = Constants.borderColor.cgColor
    }
}
