//
//  TopRightContainerRectangleView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 22.06.23.
//

import UIKit

final class TopRightContainerRectangleView: RectangleView {

    private enum Constants {
        static let widhtMultiplier: CGFloat = 0.5
    }

    private let innerRectangleView = RectangleView()

    // MARK: - Lifecycle
    override func didLoad() {
        setupItems()
    }

    // MARK: - Configure
    func configureInnerRectangle(
        with innerRectangleBackgroundColor: UIColor,
        innerRectangleBorderColor: UIColor
    ) {
        innerRectangleView.configure(
            with: innerRectangleBackgroundColor,
            borderColor: innerRectangleBorderColor
        )
    }
}

private extension TopRightContainerRectangleView {
    // MARK: - Private methods
    func setupItems() {
        setupInnerRectangleView()
    }

    func setupInnerRectangleView() {
        addSubview(innerRectangleView)
        innerRectangleView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            innerRectangleView.topAnchor.constraint(equalTo: topAnchor),
            innerRectangleView.trailingAnchor.constraint(equalTo: trailingAnchor),
            innerRectangleView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: Constants.widhtMultiplier)
        ])
    }
}
