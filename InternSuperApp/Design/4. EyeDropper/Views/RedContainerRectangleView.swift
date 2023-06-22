//
//  RedContainerRectangleView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 22.06.23.
//

import UIKit

final class RedContainerRectangleView: RectangleView {

    private enum Constants {
        static let widthMultiplier: CGFloat = 0.15
    }

    private let topRightContainerRectangleView = TopRightContainerRectangleView()
    private let middleRectangleView = RectangleView()
    private let bottomLeftRectangleView = RectangleView()
    private let topLeftRectangleView = RectangleView()

    // MARK: - Lifecycle
    override func didLoad() {
        setupItems()
    }

    // MARK: - Configure
    func configureTopRightContainerRectangleView(
        with topRightContainerRectangleBackgroundColor: UIColor,
        topRightContainerRectangleBorderColor: UIColor,
        topRightInnerRectangleViewBackgroundColor: UIColor,
        topRightInnerRectangleViewBorderColor: UIColor
    ) {
        topRightContainerRectangleView.configure(
            with: topRightContainerRectangleBackgroundColor,
            borderColor: topRightContainerRectangleBorderColor
        )
        topRightContainerRectangleView.configureInnerRectangle(
            with: topRightInnerRectangleViewBackgroundColor,
            innerRectangleBorderColor: topRightInnerRectangleViewBorderColor
        )
    }

    func configureMiddleRectangle(
        with middleRectangleBackgroundColor: UIColor,
        middleRectangleBorderColor: UIColor
    ) {
        middleRectangleView.configure(
            with: middleRectangleBackgroundColor,
            borderColor: middleRectangleBorderColor
        )
    }

    func configureBottomLeftRectangle(
        with bottomLeftRectangleBackgroundColor: UIColor,
        bottomLeftRectangleBorderColor: UIColor
    ) {
        bottomLeftRectangleView.configure(
            with: bottomLeftRectangleBackgroundColor,
            borderColor: bottomLeftRectangleBorderColor
        )
    }

    func configureTopLeftRectangle(
        with topLeftRectangleBackgroundColor: UIColor,
        topLeftRectangleBorderColor: UIColor
    ) {
        topLeftRectangleView.configure(
            with: topLeftRectangleBackgroundColor,
            borderColor: topLeftRectangleBorderColor
        )
    }
}

private extension RedContainerRectangleView {
    // MARK: - Private methods
    func setupItems() {
        setupTopRightContainerRectangleView()
        setupMiddleRectangleView()
        setupBottomLeftRectangleView()
        setupTopLeftRectangleView()
    }

    func setupTopRightContainerRectangleView() {
        addSubview(topRightContainerRectangleView)
        topRightContainerRectangleView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            topRightContainerRectangleView.topAnchor.constraint(equalTo: topAnchor),
            topRightContainerRectangleView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topRightContainerRectangleView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: Constants.widthMultiplier),
            topRightContainerRectangleView.heightAnchor.constraint(equalTo: topRightContainerRectangleView.widthAnchor)
        ])
    }

    func setupMiddleRectangleView() {
        addSubview(middleRectangleView)
        middleRectangleView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            middleRectangleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            middleRectangleView.centerYAnchor.constraint(equalTo: centerYAnchor),
            middleRectangleView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: Constants.widthMultiplier)
        ])
    }

    func setupBottomLeftRectangleView() {
        addSubview(bottomLeftRectangleView)
        bottomLeftRectangleView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            bottomLeftRectangleView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomLeftRectangleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomLeftRectangleView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: Constants.widthMultiplier)
        ])
    }

    func setupTopLeftRectangleView() {
        addSubview(topLeftRectangleView)
        topLeftRectangleView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            topLeftRectangleView.topAnchor.constraint(equalTo: topAnchor),
            topLeftRectangleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topLeftRectangleView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: Constants.widthMultiplier),
        ])
    }
}
