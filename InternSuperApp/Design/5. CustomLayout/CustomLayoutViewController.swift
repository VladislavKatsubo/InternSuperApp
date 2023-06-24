//
//  CustomLayoutViewController.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 22.06.23.
//

import UIKit

final class CustomLayoutViewController: UIViewController {

    typealias Constants = CustomLayoutResources.Constants.UI
    typealias Mocks = CustomLayoutResources.Constants.Mocks

    private let coverView = CoverView()
    private let gradientTitleView = GradientTitleView()
    private let verticalStackView = IStackView(axis: .vertical)
    private let iconProfileFollowView = IconProfileFollowView()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
    }
}

private extension CustomLayoutViewController {
    // MARK: - Private methods
    func setupItems() {
        setupCoverView()
//        setupGradientTitleView()
        setupStackView()
        setupIconProfileFollow()
    }

    func setupCoverView() {
        view.addSubview(coverView)
        coverView.translatesAutoresizingMaskIntoConstraints = false
        coverView.configure(with: Mocks.coverViewImage)

        NSLayoutConstraint.activate([
            coverView.topAnchor.constraint(equalTo: view.topAnchor),
            coverView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coverView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            coverView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7)
        ])
    }

    func setupGradientTitleView() {
        view.addSubview(gradientTitleView)
        gradientTitleView.translatesAutoresizingMaskIntoConstraints = false
        gradientTitleView.configure(with: "Winner of the 2023 World Car Awards")

        NSLayoutConstraint.activate([
            gradientTitleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientTitleView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientTitleView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    func setupStackView() {
        view.addSubview(verticalStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.addArrangedSubview(iconProfileFollowView)


        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: coverView.bottomAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    func setupIconProfileFollow() {
        iconProfileFollowView.translatesAutoresizingMaskIntoConstraints = false
        iconProfileFollowView.configure(with: Mocks.iconProfileModel)

//        NSLayoutConstraint.activate([
//            iconProfileFollowView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            iconProfileFollowView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            iconProfileFollowView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            iconProfileFollowView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        ])
    }
}
