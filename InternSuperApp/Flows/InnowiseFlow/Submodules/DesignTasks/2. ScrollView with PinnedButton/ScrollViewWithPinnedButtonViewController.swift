//
//  ScrollViewWithPinnedButtonViewController.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 21.06.23.
//

import UIKit

final class ScrollViewWithPinnedButtonViewController: UIViewController {

    typealias Constants = ScrollViewWithPinnedButtonResources.Constants.UI

    private let scrollView = UIScrollView(frame: .zero)
    private let containerView = IView()
    private let stackView = IStackView(axis: .vertical, spacing: Constants.stackViewSpacing)
    private let mockButton = ScrollViewButton()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
    }
}

private extension ScrollViewWithPinnedButtonViewController {
    // MARK: - Private methods
    func setupItems() {
        self.view.backgroundColor = .systemBackground

        setupScrollView()
        setupContainerView()
        setupStackView()
        setupMockBlocks()
        setupButton()
    }

    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.scrollViewOffset),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.scrollViewOffset),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Constants.scrollViewInset),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: Constants.scrollViewInset),
        ])
    }

    func setupContainerView() {
        scrollView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            containerView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor) // Key to success
        ])
    }

    func setupStackView() {
        containerView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        ])
    }

    func setupMockBlocks() {
        Constants.colors.forEach({
            let mockBlock = ScrollViewBlockView()

            mockBlock.configure(with: $0)
            mockBlock.translatesAutoresizingMaskIntoConstraints = false

            stackView.addArrangedSubview(mockBlock)
        })
    }

    func setupButton() {
        containerView.addSubview(mockButton)
        mockButton.translatesAutoresizingMaskIntoConstraints = false
        
        mockButton.configure(
            with: Constants.buttonText,
            textColor: Constants.buttonTextColor,
            backgroundColor: Constants.buttonColor
        )

        NSLayoutConstraint.activate([
            mockButton.topAnchor.constraint(greaterThanOrEqualTo: stackView.bottomAnchor, constant: Constants.buttonTopOffset),
            mockButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            mockButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            mockButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
}
