//
//  ScrollViewButton.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 21.06.23.
//

import UIKit

final class ScrollViewButton: IButton {

    private enum Constants {
        static let height: CGFloat = 50.0
    }

    // MARK: - Public methods
    override func didLoad() {
        super.didLoad()
        setupItems()
    }

    // MARK: - Configure
    func configure(with text: String, textColor: UIColor, backgroundColor: UIColor) {
        self.title = text
        self.titleColor = textColor
        self.backgroundColor = backgroundColor
    }
}

private extension ScrollViewButton {
    // MARK: - Private methods
    func setupItems() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: Constants.height)
        ])
    }
}
