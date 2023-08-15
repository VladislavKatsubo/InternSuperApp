//
//  EyedropperViewController.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 22.06.23.
//

import UIKit

final class EyedropperViewController: UIViewController {

    typealias Constants = EyedropperResources.Constants.UI

    private let redContainerRectangleView = RedContainerRectangleView()
    private let backgroundView = IView()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
    }
}

private extension EyedropperViewController {
    // MARK: - Private methods
    func setupItems() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = false

        setupBackgroundView()
        setupRedContainerRectangleView()
    }

    func setupBackgroundView() {
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false

        backgroundView.backgroundColor = Constants.backgroundViewColor
        backgroundView.layer.borderColor = Constants.backgroundViewBorderColor.cgColor
        backgroundView.layer.borderWidth = Constants.backgroundViewBorderWidth

        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    func setupRedContainerRectangleView() {
        backgroundView.addSubview(redContainerRectangleView)
        redContainerRectangleView.translatesAutoresizingMaskIntoConstraints = false
        
        redContainerRectangleView.configure(
            with: Constants.redContainerViewBackgroundColor,
            borderColor: Constants.redContainerViewBorderColor
        )

        redContainerRectangleView.configureTopRightContainerRectangleView(
            with: Constants.topRightRectangleViewBackgroundColor,
            topRightContainerRectangleBorderColor: Constants.rectangleBorderColor,
            topRightInnerRectangleViewBackgroundColor: Constants.innerTopRightRectangleViewBackgroundColor,
            topRightInnerRectangleViewBorderColor: Constants.rectangleBorderColor
        )

        redContainerRectangleView.configureMiddleRectangle(
            with: Constants.middleRectangleViewBackgroundColor,
            middleRectangleBorderColor: Constants.rectangleBorderColor
        )

        redContainerRectangleView.configureTopLeftRectangle(
            with: Constants.topLeftRectangleViewBackgroundColor,
            topLeftRectangleBorderColor: Constants.rectangleBorderColor
        )

        redContainerRectangleView.configureBottomLeftRectangle(
            with: Constants.bottomLeftRectangleViewBackgroundColor,
            bottomLeftRectangleBorderColor: Constants.rectangleBorderColor
        )

        NSLayoutConstraint.activate([
            redContainerRectangleView.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            redContainerRectangleView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            redContainerRectangleView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: Constants.redContainerViewWidthMultiplier),
            redContainerRectangleView.heightAnchor.constraint(equalTo: redContainerRectangleView.widthAnchor)
        ])
    }
}
