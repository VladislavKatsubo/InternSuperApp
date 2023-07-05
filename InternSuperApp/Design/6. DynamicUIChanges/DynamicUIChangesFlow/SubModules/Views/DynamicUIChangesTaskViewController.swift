//
//  DynamicUIChangesTaskViewController.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 5.07.23.
//

import UIKit

class DynamicUIChangesTaskViewController: UIViewController {

    private enum Constants {
        static let verticalStackViewSpacing: CGFloat = 16.0
        static let verticalStackViewLeadingOffset: CGFloat = 16.0
        static let verticalStackViewTrailingInset: CGFloat = -16.0
        static let verticalStackViewBottomInset: CGFloat = -16.0
    }

    private(set) var initialImageView = DynamicUIChangesImageView()
    private let verticalStackView = IStackView(axis: .vertical, spacing: Constants.verticalStackViewSpacing)
    private let positiveActionButton = AnimatedGradientButton()
    private let negativeActionButton = AnimatedGradientButton()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
    }

    // MARK: - Public methods
    func setupPositiveActionButton(with text: String, _ completion: @escaping () -> Void) {
        positiveActionButton.configure(with: text)
        positiveActionButton.onTap = {
            completion()
        }
    }

    func setupNegativeActionButton(with text: String, _ completion: @escaping () -> Void) {
        negativeActionButton.configure(with: text)
        negativeActionButton.onTap = {
            completion()
        }
    }

    func setupImageView(with image: UIImage?) {
        initialImageView.configure(with: image)
    }
}

private extension DynamicUIChangesTaskViewController {
    // MARK: - Private methods
    func setupItems() {
        view.backgroundColor = .systemBackground

        setupInitialImageView()
        setupVerticalStackView()
    }

    func setupInitialImageView() {
        view.addSubview(initialImageView)
        initialImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            initialImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            initialImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

    func setupVerticalStackView() {
        view.addSubview(verticalStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false

        verticalStackView.addArrangedSubview(positiveActionButton)
        verticalStackView.addArrangedSubview(negativeActionButton)

        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.verticalStackViewLeadingOffset),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.verticalStackViewTrailingInset),
            verticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: Constants.verticalStackViewBottomInset)
        ])
    }
}
