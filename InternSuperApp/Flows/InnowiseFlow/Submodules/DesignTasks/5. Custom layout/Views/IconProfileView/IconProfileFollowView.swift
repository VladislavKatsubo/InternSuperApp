//
//  IconProfileFollowView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 22.06.23.
//

import UIKit

final class IconProfileFollowView: IView {

    private enum Constants {
        static let iconSize: CGSize = .init(width: 55.0, height: 55.0)
        static let profileNameLabelFont: UIFont = .systemFont(ofSize: 16.0, weight: .regular)
        static let publishedDateLabelFont: UIFont = .systemFont(ofSize: 14.0, weight: .thin)

        static let verticalStackViewLeadingOffset: CGFloat = 10.0

        static let profileIconWidthMultiplier: CGFloat = 0.125

        static let gradientedButtonWidthMultiplier: CGFloat = 0.33
    }

    private let circularProfileIconImageView = ICircleImageView()
    private let roundedGradientShadowedButton = FollowShadowButtonView()
    private let profileNameLabel = UILabel()
    private let publishedDateLabel = UILabel()
    private let verticalStackView = IStackView(axis: .vertical)

    // MARK: - Lifecycle
    override func didLoad() {
        setupItems()
    }

    // MARK: - Configure
    func configure(with model: Model) {
        self.circularProfileIconImageView.animateTransition { [weak self] in
            self?.circularProfileIconImageView.image = model.profileImage
        }
        self.profileNameLabel.animateTransition { [weak self] in
            self?.profileNameLabel.text = model.name
        }
        self.publishedDateLabel.animateTransition { [weak self] in
            self?.publishedDateLabel.text = model.publishDate?.daysElapsed()
        }
    }
}

private extension IconProfileFollowView {
    // MARK: - Private methods
    func setupItems() {
        setupIcon()
        setupStackView()
        setupProfileNameLabel()
        setupPublishedDateLabel()
        setupFollowButton()
    }

    func setupIcon() {
        addSubview(circularProfileIconImageView)
        circularProfileIconImageView.translatesAutoresizingMaskIntoConstraints = false
        circularProfileIconImageView.clipsToBounds = true

        NSLayoutConstraint.activate([
            circularProfileIconImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            circularProfileIconImageView.topAnchor.constraint(equalTo: topAnchor),
            circularProfileIconImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            circularProfileIconImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: Constants.profileIconWidthMultiplier),
            circularProfileIconImageView.heightAnchor.constraint(equalTo: circularProfileIconImageView.widthAnchor)
        ])
    }

    func setupStackView() {
        addSubview(verticalStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.addArrangedSubview(profileNameLabel)
        verticalStackView.addArrangedSubview(publishedDateLabel)

        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: circularProfileIconImageView.trailingAnchor, constant: Constants.verticalStackViewLeadingOffset),
            verticalStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

    func setupProfileNameLabel() {
        profileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        profileNameLabel.font = Constants.profileNameLabelFont
        profileNameLabel.textColor = .white
    }

    func setupPublishedDateLabel() {
        publishedDateLabel.translatesAutoresizingMaskIntoConstraints = false
        publishedDateLabel.font = Constants.publishedDateLabelFont
        publishedDateLabel.textColor = .white
    }

    func setupFollowButton() {
        addSubview(roundedGradientShadowedButton)
        roundedGradientShadowedButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            roundedGradientShadowedButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            roundedGradientShadowedButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            roundedGradientShadowedButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: Constants.gradientedButtonWidthMultiplier),
        ])
    }
}
