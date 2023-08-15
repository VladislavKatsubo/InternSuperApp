//
//  IconsStackView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 24.06.23.
//

import UIKit

final class IconsStackView: IView {

    private enum Constants {
        static let profileIconSize: CGSize = .init(width: 30.0, height: 30.0)
        static let stackViewSpacing: CGFloat = -Constants.profileIconSize.height / 3.0
    }

    private let stackView = IStackView(axis: .horizontal, spacing: Constants.stackViewSpacing)
    private let membersCounterView = MembersCounterView()


    // MARK: - Lifecycle
    override func didLoad() {
        setupItems()
    }

    // MARK: - Configure
    func configure(with images: [UIImage?]) {
        self.removeStackViewSubviews()
        self.setupProfileIcons(with: images)
    }
}

private extension IconsStackView {
    // MARK: - Private methods
    func setupItems() {
        setupStackView()
    }

    func setupStackView() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    func setupProfileIcons(with images: [UIImage?]) {
        let maxIconsCount = min(4, images.count)

        if images.count > 4 {
            self.addIconsToStackView(with: images)
            self.setupMembersCountView(with: images.count)
        } else {
            self.addIconsToStackView(with: images, numberOfIconsToAdd: maxIconsCount)
        }
    }

    func addIconsToStackView(with images: [UIImage?], numberOfIconsToAdd: Int = 4) {
        for image in images[0..<numberOfIconsToAdd] {
            let profileIcon = ICircleImageView()
            profileIcon.image = image
            profileIcon.contentMode = .scaleToFill
            profileIcon.clipsToBounds = true

            stackView.addArrangedSubview(profileIcon)

            NSLayoutConstraint.activate([
                profileIcon.widthAnchor.constraint(equalToConstant: Constants.profileIconSize.width),
                profileIcon.heightAnchor.constraint(equalToConstant: Constants.profileIconSize.height)
            ])
        }
    }

    func setupMembersCountView(with amountOfMembers: Int) {
        insertSubview(membersCounterView, belowSubview: stackView)
        membersCounterView.translatesAutoresizingMaskIntoConstraints = false

        let remainingAmountOfMebers = amountOfMembers - 4
        membersCounterView.configure(with: remainingAmountOfMebers)

        NSLayoutConstraint.activate([
            membersCounterView.centerYAnchor.constraint(equalTo: centerYAnchor),
            membersCounterView.leadingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: Constants.stackViewSpacing),
            membersCounterView.widthAnchor.constraint(equalToConstant: Constants.profileIconSize.width),
            membersCounterView.heightAnchor.constraint(equalToConstant: Constants.profileIconSize.height)
        ])
    }

    func removeStackViewSubviews() {
        stackView.arrangedSubviews.forEach {
            stackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
}
