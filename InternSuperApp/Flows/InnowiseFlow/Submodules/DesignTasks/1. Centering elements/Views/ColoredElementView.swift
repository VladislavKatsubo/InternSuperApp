//
//  ColoredElementView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 20.06.23.
//

import UIKit

final class ColoredElementView: IView {

    private enum Constants {
        static let height: CGFloat = 50.0
    }

    // MARK: - Lifecycle
    override func didLoad() {
        setupItems()
    }

    // MARK: - Configure
    func configure(with color: UIColor) {
        self.backgroundColor = color
    }
}

private extension ColoredElementView {
    // MARK: - Private methods
    func setupItems() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: Constants.height)
        ])
    }
}
