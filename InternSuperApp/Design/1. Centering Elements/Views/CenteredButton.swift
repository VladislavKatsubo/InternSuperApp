//
//  CenteredButton.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 20.06.23.
//

import UIKit

final class CenteredButton: IButton {

    private enum Constants {
        static let height: CGFloat = 50.0
        static let backgroundColor: UIColor = .systemGreen
    }

    // MARK: - Public methods
    override func didLoad() {
        super.didLoad()
        setupItems()
    }

    // MARK: - Configure
    func configure(with text: String, textColor: UIColor) {
        self.title = text
        self.titleColor = textColor
    }
}

private extension CenteredButton {
    // MARK: - Private methods
    func setupItems() {
        self.backgroundColor = Constants.backgroundColor

        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: Constants.height)
        ])
    }
}
