//
//  ContentUnavailableView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 15.08.23.
//

import UIKit

final class ContentUnavailableView: IView {

    private enum Constants {
        static let titleLabelFont: UIFont = .systemFont(ofSize: 26.0, weight: .bold)
        static let titleLabelFontColor: UIColor = .label

        static let subtitleLabelFont: UIFont = .systemFont(ofSize: 20.0, weight: .regular)
        static let subtitleLabelFontColor: UIColor = .secondaryLabel

        static let iconImageViewSize: CGSize = .init(width: 80.0, height: 80.0)
        static let iconImageViewStackViewSpacing: CGFloat = 15.0
        static let iconImageViewYInset: CGFloat = -40.0

        static let verticalStackViewTopOffset :CGFloat = 8.0
    }

    private let scrollView = UIScrollView()
    private let verticalStackView = IStackView(axis: .vertical)
    private let iconImageView = IImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let refreshControl = UserDataRefreshControl()

    var onPullToRefresh: (() -> Void)?

    // MARK: - Lifecycle
    override func didLoad() {
        super.didLoad()
        setupItems()
    }

    // MARK: - Configure
    func configure(with model: Model) {
        self.iconImageView.image = model.icon
        self.titleLabel.text = model.title
        self.subtitleLabel.text = model.subtitle
    }
}

private extension ContentUnavailableView {
    // MARK: - Private methods
    func setupItems() {
        self.backgroundColor = .white

        setupScrollView()
        setupRefreshControl()
        setupIconImageView()
        setupVerticalStackView()
        setupTitleLabel()
        setupSubtitleLabel()
    }

    func setupScrollView() {
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    func setupIconImageView() {
        scrollView.addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            iconImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: Constants.iconImageViewYInset),
            iconImageView.widthAnchor.constraint(equalToConstant: Constants.iconImageViewSize.width),
            iconImageView.heightAnchor.constraint(equalToConstant: Constants.iconImageViewSize.height),
        ])
    }

    func setupVerticalStackView() {
        scrollView.addSubview(verticalStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false

        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(subtitleLabel)

        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: Constants.verticalStackViewTopOffset),
            verticalStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }

    func setupTitleLabel() {
        titleLabel.font = Constants.titleLabelFont
        titleLabel.textColor = Constants.titleLabelFontColor
        titleLabel.numberOfLines = .zero
        titleLabel.textAlignment = .center
    }

    func setupSubtitleLabel() {
        subtitleLabel.font = Constants.subtitleLabelFont
        subtitleLabel.textColor = Constants.subtitleLabelFontColor
        subtitleLabel.numberOfLines = .zero
        subtitleLabel.textAlignment = .center
    }

    // MARK: - Refresh control
    func setupRefreshControl() {
        scrollView.refreshControl = refreshControl
        refreshControl.onPull = { [weak self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self?.onPullToRefresh?()
                self?.refreshControl.endRefreshing()
            }
        }
    }
}
