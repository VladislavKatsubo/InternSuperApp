//
//  CardCollectionViewCell.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 7.08.23.
//

import UIKit

final class CardCollectionViewCell: ICollectionCell {

    // MARK: - Constants
    private enum Constants {
        static let containerViewLeadingOffset: CGFloat = 40.0
        static let containerViewTrailingInset: CGFloat = -40.0
        static let containerViewTopOffset: CGFloat = 20.0
        static let containerViewBottomInset: CGFloat = -20.0

        static let avatarImageViewOffset: CGFloat = 16.0
        static let avatarImageViewInset: CGFloat = -16.0
        static let avatarImageViewSize: CGSize = .init(width: 40.0, height: 40.0)

        static let verticalStackViewLeadingOffset: CGFloat = 16.0
        static let verticalStackViewBottomInset: CGFloat = -16.0

        static let nameLabelFont: UIFont = .systemFont(ofSize: 16.0, weight: .regular)
        static let nameLabelFontColor: UIColor = .black

        static let ageLabelFont: UIFont = .systemFont(ofSize: 14.0, weight: .light)
        static let ageLabelFontColor: UIColor = .secondaryLabel

        static let descriptionLabelFont: UIFont = .systemFont(ofSize: 14.0, weight: .light)
        static let descriptionLabelFontColor: UIColor = .tertiaryLabel

        static let sexLabelFont: UIFont = .systemFont(ofSize: 20.0, weight: .light)
        static let sexIconTrailingInset: CGFloat = -16.0
        static let sexIconLeadingOffset: CGFloat = 16.0
        static let sexIconTopOffset: CGFloat = 16.0
    }

    private let containerView = IView()
    private let avatarImageView = AvatarImageView()
    private let verticalStackView = IStackView(axis: .vertical, distribution: .fillProportionally, spacing: 6.0)
    private let nameLabel = UILabel()
    private let ageLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let sexIconLabel = UILabel()

    private var viewModel: CardCollectionViewCellViewModelProtocol?

    // MARK: - Lifecycle
    override func didLoad() {
        setupItems()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.cleanup()
    }

    // MARK: - Configure
    func configure(viewModel: CardCollectionViewCellViewModelProtocol) {
        self.viewModel = viewModel
        self.setupViewModel()
    }
}

private extension CardCollectionViewCell {
    // MARK: - Private methods
    func setupViewModel() {
        self.viewModel?.onUserImageData = { [weak self] imageData in
            guard let self = self else { return }
            self.avatarImageView.configure(with: imageData, shape: .square)
        }

        self.viewModel?.onUserInfo = { [weak self] model in
            guard let self = self,
                  let firstName = model.firstName,
                  let lastName = model.lastName,
                  let age = model.age,
                  let sex = model.sex,
                  let sexIcon = sex.userSexIcon,
                  let description = model.description
            else {
                return
            }

            self.nameLabel.text = firstName.capitalized + " " + lastName.capitalized
            self.ageLabel.text = "Age: " + String(age)
            self.descriptionLabel.text = description
            self.sexIconLabel.text = String(sexIcon)
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
        setupDescriptionLabel()
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
            avatarImageView.widthAnchor.constraint(equalToConstant: Constants.avatarImageViewSize.width),
            avatarImageView.heightAnchor.constraint(equalToConstant: Constants.avatarImageViewSize.height),
        ])
    }

    func setupVerticalStackView() {
        containerView.addSubview(verticalStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false

        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(ageLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Constants.verticalStackViewLeadingOffset),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.verticalStackViewBottomInset)
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

    func setupDescriptionLabel() {
        descriptionLabel.font = Constants.ageLabelFont
        descriptionLabel.textColor = Constants.ageLabelFontColor
        descriptionLabel.numberOfLines = .zero
    }

    func setupSexIcon() {
        containerView.addSubview(sexIconLabel)
        sexIconLabel.translatesAutoresizingMaskIntoConstraints = false
        sexIconLabel.font = Constants.sexLabelFont
        sexIconLabel.textAlignment = .right

        NSLayoutConstraint.activate([
            sexIconLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.sexIconTopOffset),
            sexIconLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: Constants.sexIconTrailingInset),
            sexIconLabel.leadingAnchor.constraint(equalTo: verticalStackView.trailingAnchor, constant: Constants.sexIconLeadingOffset)
        ])
    }

    func cleanup() {
        self.viewModel?.cancelImageDownload()
        self.avatarImageView.reset()
        self.nameLabel.text = nil
        self.ageLabel.text = nil
        self.sexIconLabel.text = nil
    }
}
