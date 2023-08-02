//
//  TwoLineTableViewCell.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 2.08.23.
//

import UIKit

final class TwoLineTableViewCell: ITableViewCell {

    private enum Constants {
        static let avatarImageViewOffset: CGFloat = 16.0
        static let avatarImageViewInset: CGFloat = -16.0
        static let avatarImageViewSize: CGSize = .init(width: 40.0, height: 40.0)
    }

    private let avatarImageView = AvatarImageView()
    private let verticalStackView = IStackView(axis: .vertical)
    private let nameLabel = UILabel()
    private let ageLabel = UILabel()
    private let sexIcon = UIImageView()

    // MARK: - Lifecycle
    override func didLoad() {
        super.didLoad()
        setupItems()
    }

    // MARK: - Configure
    func configure(with model: Model) {
        guard let firstName = model.firstName,
              let lastName = model.lastName,
              let age = model.age,
              let image = model.avatarImage
        else {
            return
        }

        self.avatarImageView.configure(with: image, shape: .round)
        self.nameLabel.text = firstName.capitalized + " " + lastName.capitalized
        self.ageLabel.text = "Age: " + String(age)
    }
}

private extension TwoLineTableViewCell {
    // MARK: - Private methods
    func setupItems() {
        setupAvatarImageView()
    }

    func setupAvatarImageView() {
        addSubview(avatarImageView)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.avatarImageViewOffset),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.avatarImageViewOffset),
            avatarImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.avatarImageViewInset),
            avatarImageView.widthAnchor.constraint(equalToConstant: Constants.avatarImageViewSize.width),
            avatarImageView.heightAnchor.constraint(equalToConstant: Constants.avatarImageViewSize.height),
        ])
    }
}
