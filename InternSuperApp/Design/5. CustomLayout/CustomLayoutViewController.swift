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
    private let verticalStackView = IStackView(axis: .vertical)
    private let titleLabel = UILabel()
    private let iconProfileFollowView = IconProfileFollowView()
    private let recommendationsCountView = RecommendationsCountView()
    private let separatorLineView = SeparatorLineView()
    private let statisticView = StatisticsView()

    private var viewModel: CustomLayoutViewModelProtocol?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
        setupViewModel()

        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5 * Double(i)) { [weak self] in
                self?.viewModel?.reloadModels()
            }
        }
    }

    // MARK: - Configure
    func configure(with viewModel: CustomLayoutViewModelProtocol) {
        self.viewModel = viewModel
    }
}

private extension CustomLayoutViewController {
    // MARK: - Private methods
    func setupViewModel() {
        self.viewModel?.onStateChange = { [weak self] state in
            guard let self = self else { return }

            switch state {
            case .onCoverView(let image):
                self.coverView.configure(with: image)
            case .onTitleLabel(let text):
                self.titleLabel.animateTransition {
                    self.titleLabel.text = text
                }
            case .onIconProfileFollowView(let model):
                self.iconProfileFollowView.configure(with: model)
            case .onRecommendationsCountView(let model):
                self.recommendationsCountView.configure(with: model)
            case .onStatisticView(let model):
                self.statisticView.configure(with: model)
            }
        }
        self.viewModel?.launch()
    }

    func setupItems() {
        setupCoverView()
        setupStackView()
        setupTitleLabel()
    }

    func setupCoverView() {
        view.addSubview(coverView)
        coverView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            coverView.topAnchor.constraint(equalTo: view.topAnchor),
            coverView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coverView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            coverView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7)
        ])
    }

    func setupStackView() {
        view.addSubview(verticalStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false

        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.setCustomSpacing(Constants.titleLabelCustomSpacing, after: titleLabel)
        verticalStackView.addArrangedSubview(iconProfileFollowView)
        verticalStackView.setCustomSpacing(Constants.iconProfileFollowViewCustomSpacing, after: iconProfileFollowView)
        verticalStackView.addArrangedSubview(separatorLineView)
        verticalStackView.setCustomSpacing(Constants.separatorLineViewCustomSpacing, after: separatorLineView)
        verticalStackView.addArrangedSubview(recommendationsCountView)
        verticalStackView.setCustomSpacing(Constants.recommendationsCountViewCustomSpacing, after: recommendationsCountView)
        verticalStackView.addArrangedSubview(statisticView)

        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: coverView.bottomAnchor, constant: Constants.stackViewTopOffset),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.stackViewLeadingOffset),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.stackViewTrailingInset),
            verticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: Constants.stackViewBottomInset),
        ])
    }

    func setupTitleLabel() {
        titleLabel.font = Constants.titleLabelFont
        titleLabel.textColor = Constants.titleLabelTextColor
        titleLabel.numberOfLines = Constants.titleLabelNumberOfLines

        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: Constants.titleLabelHeight)
        ])
    }
}
