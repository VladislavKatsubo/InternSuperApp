//
//  TaskSectionsTableViewCell.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 23.07.23.
//

import UIKit

final class TaskSectionsTableViewCell: ITableViewCell {

    private enum Constants {
        static let labelFont: UIFont = .systemFont(ofSize: 16.0, weight: .semibold)
        static let labelFontColor: UIColor = .black

        static let taskSectionTitleLabelOffset: CGFloat = 20.0
        static let taskSectionTitleLabelInset: CGFloat = -20.0
    }

    private let containerView = IView()
    private let taskSectionTitleLabel = UILabel()

    // MARK: - Lifecycle
    override func didLoad() {
        super.didLoad()
        setupItems()
    }

    // MARK: - Configure
    func configure(with title: String) {
        self.taskSectionTitleLabel.text = title
    }
}

private extension TaskSectionsTableViewCell {
    // MARK: - Private methods
    func setupItems() {
        backgroundColor = .clear
        
        setupContainerView()
        setupTaskSectionTitleLabel()
    }

    func setupContainerView() {
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    func setupTaskSectionTitleLabel() {
        containerView.addSubview(taskSectionTitleLabel)
        taskSectionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        taskSectionTitleLabel.font = Constants.labelFont
        taskSectionTitleLabel.textColor = Constants.labelFontColor

        NSLayoutConstraint.activate([
            taskSectionTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.taskSectionTitleLabelOffset),
            taskSectionTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.taskSectionTitleLabelOffset),
            taskSectionTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.taskSectionTitleLabelInset),
            taskSectionTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
