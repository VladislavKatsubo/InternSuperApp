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
    private let verticalStackView = IStackView(axis: .vertical, distribution: .fill)
    private let iconProfileFollowView = IconProfileFollowView()
    private let recommendationsCountView = RecommendationsCountView()
    private let separatorLineView = SeparatorLineView()

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
        setupRecommendationsCounterView()
        setupSeparatorLineView()
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
        gradientTitleView.configure(with: Mocks.gradientTitleViewLabelText)

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
        verticalStackView.setCustomSpacing(25.0, after: iconProfileFollowView)
        verticalStackView.addArrangedSubview(recommendationsCountView)
        verticalStackView.setCustomSpacing(10.0, after: recommendationsCountView)
        verticalStackView.addArrangedSubview(separatorLineView)

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
    }

    func setupRecommendationsCounterView() {
        recommendationsCountView.configure(with: Mocks.recommendationsCountViewModel)
    }

    func setupSeparatorLineView() {
        separatorLineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separatorLineView.heightAnchor.constraint(equalToConstant: 1.0)
        ])
    }
}
