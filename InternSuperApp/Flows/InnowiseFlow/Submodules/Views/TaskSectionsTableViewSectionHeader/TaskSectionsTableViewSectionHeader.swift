//
//  TaskSectionsTableViewSectionHeader.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 29.07.23.
//

import UIKit

final class TaskSectionsTableViewSectionHeader: ISectionCell {

    // MARK: - Constants
    private enum Constants {
        static let topTitleOffset: CGFloat = 20.0
        static let leadingTitleOffset: CGFloat = 30.0
        static let bottomTitleInset: CGFloat = -20.0
        static let titleFont: UIFont = .systemFont(ofSize: 20.0, weight: .bold)
    }

    private let titleLabel = UILabel()

    // MARK: - Configure
    func configure(with text: String?) {
        titleLabel.text = text
    }

    // MARK: - Public methods
    override func didLoad() {
        super.didLoad()
        setupTitleLabel()
    }
}

private extension TaskSectionsTableViewSectionHeader {
    // MARK: - Private methods
    func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = Constants.titleFont

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.topTitleOffset),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.leadingTitleOffset),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.bottomTitleInset),
        ])
    }
}
