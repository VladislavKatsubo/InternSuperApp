//
//  TwoLineTableViewCell.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 2.08.23.
//

import UIKit

class TwoLineTableViewCell: ITableViewCell {

    private enum Constants {
        static let containerViewLeadingOffset: CGFloat = 40.0
        static let containerViewTrailingInset: CGFloat = -40.0
        static let containerViewTopOffset: CGFloat = 20.0
        static let containerViewBottomInset: CGFloat = -20.0
        static let containerViewHeight: CGFloat = 72.0

        static let avatarImageViewOffset: CGFloat = 16.0
        static let avatarImageViewInset: CGFloat = -16.0
        static let avatarImageViewSize: CGSize = .init(width: 40.0, height: 40.0)

        static let verticalStackViewLeadingOffset: CGFloat = 16.0

        static let nameLabelFont: UIFont = .systemFont(ofSize: 16.0, weight: .regular)
        static let nameLabelFontColor: UIColor = .black

        static let ageLabelFont: UIFont = .systemFont(ofSize: 14.0, weight: .light)
        static let ageLabelFontColor: UIColor = .secondaryLabel

        static let sexLabelFont: UIFont = .systemFont(ofSize: 20.0, weight: .light)
        static let sexIconTrailingInset: CGFloat = -16.0
    }

    private let containerView = IView()
    private let avatarImageView = AvatarImageView()
    private let verticalStackView = IStackView(axis: .vertical, distribution: .fillEqually, spacing: 6.0)
    private let nameLabel = UILabel()
    private let ageLabel = UILabel()
    private let sexLabel = UILabel()

    private var viewModel: TwoLineTableViewCellViewModelProtocol?

    // MARK: - Lifecycle
    override func didLoad() {
        super.didLoad()
        setupItems()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        cleanup()
    }

    // MARK: - Configure
    func configure(with viewModel: TwoLineTableViewCellViewModelProtocol) {
        self.viewModel = viewModel
        setupViewModel()
    }
}

private extension TwoLineTableViewCell {
    // MARK: - Private methods
    func setupViewModel() {
        self.viewModel?.onUserImageData = { [weak self] imageData in
            guard let self = self else { return }
            self.avatarImageView.configure(with: imageData, shape: .round)
        }
        self.viewModel?.onUserInfo = { [weak self] model in
            guard let self = self,
                  let firstName = model.firstName,
                  let lastName = model.lastName,
                  let age = model.age,
                  let sex = model.sex,
                  let sexIcon = sex.userSexIcon
            else {
                return
            }

            self.nameLabel.text = firstName.capitalized + " " + lastName.capitalized
            self.ageLabel.text = "Age: " + String(age)
            self.sexLabel.text = String(sexIcon)
        }
        viewModel?.launch()
    }

    func setupItems() {
        self.backgroundColor = .clear

        setupContainerView()
        setupAvatarImageView()
        setupVerticalStackView()
        setupNameLabel()
        setupAgeLabel()
        setupSexIcon()
    }

    func setupContainerView() {
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.containerViewTopOffset),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.containerViewLeadingOffset),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.containerViewTrailingInset),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.containerViewBottomInset),
        ])
    }

    func setupAvatarImageView() {
        containerView.addSubview(avatarImageView)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.avatarImageViewOffset),
            avatarImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.avatarImageViewOffset),
            avatarImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: Constants.avatarImageViewInset),
            avatarImageView.widthAnchor.constraint(equalToConstant: Constants.avatarImageViewSize.width),
            avatarImageView.heightAnchor.constraint(equalToConstant: Constants.avatarImageViewSize.height),
        ])
    }

    func setupVerticalStackView() {
        containerView.addSubview(verticalStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false

        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(ageLabel)

        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Constants.verticalStackViewLeadingOffset),
            verticalStackView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor)
        ])
    }

    func setupNameLabel() {
        nameLabel.font = Constants.nameLabelFont
        nameLabel.textColor = Constants.nameLabelFontColor
    }

    func setupAgeLabel() {
        ageLabel.font = Constants.ageLabelFont
        ageLabel.textColor = Constants.ageLabelFontColor
    }

    func setupSexIcon() {
        containerView.addSubview(sexLabel)
        sexLabel.translatesAutoresizingMaskIntoConstraints = false
        sexLabel.font = Constants.sexLabelFont

        NSLayoutConstraint.activate([
            sexLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            sexLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: Constants.sexIconTrailingInset),
        ])
    }

    func cleanup() {
        self.viewModel?.cancelImageDownload()
        self.avatarImageView.reset()
        self.nameLabel.text = nil
        self.ageLabel.text = nil
        self.sexLabel.text = nil
    }
}
