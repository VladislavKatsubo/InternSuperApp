//
//  RectangleView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 22.06.23.
//

import UIKit

class RectangleView: IView {

    private enum Constants {
        static let borderWidth: CGFloat = 1.0
    }

    // MARK: - Lifecycle
    override func didLoad() {
        setupItems()
    }

    // MARK: - Configure
    func configure(with backgroundColor: UIColor, borderColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = Constants.borderWidth
    }
}

private extension RectangleView {
    // MARK: - Private methods
    func setupItems() {
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalTo: self.heightAnchor),
            self.heightAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
}
