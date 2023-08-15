//
//  ScrollViewBlockView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 21.06.23.
//

import UIKit

final class ScrollViewBlockView: IView {

    private enum Constants {
        static let height: CGFloat = 300.0
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

private extension ScrollViewBlockView {
    // MARK: - Private methods
    func setupItems() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: Constants.height),
        ])
    }
}