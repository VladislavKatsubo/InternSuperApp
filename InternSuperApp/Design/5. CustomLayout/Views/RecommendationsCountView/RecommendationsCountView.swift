//
//  RecommendationsCountView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 24.06.23.
//

import UIKit

final class RecommendationsCountView: IView {

    private enum Constants {
        static let labelFont: UIFont = .systemFont(ofSize: 16.0, weight: .regular)
        static let labelFontColor: UIColor = .systemGray2

        static let recommendedLabelText: String = "Recommended by :"
        static let counterLabelText: String = " users"
    }

    private let horizontalStackView = IStackView(axis: .horizontal)
    private let recommendedLabel = UILabel()
    private let counterLabel = UILabel()

    // MARK: - Lifecycle
    override func didLoad() {
        setupItems()
    }

    // MARK: - Configure
    func configure(with model: Model) {
        guard let currentUsersAmount = model.currentAmount,
              let maxUsersAmount = model.maxAmount
        else {
            return
        }

        counterLabel.text = String(currentUsersAmount) + " / " + String(maxUsersAmount) + Constants.counterLabelText
        recommendedLabel.text = Constants.recommendedLabelText
    }
}

private extension RecommendationsCountView {
    // MARK: - Private methods
    func setupItems() {
        setupStackView()
        setupRecommendedLabel()
        setupCounterLabel()
    }

    func setupStackView() {
        addSubview(horizontalStackView)
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.addArrangedSubview(recommendedLabel)
        horizontalStackView.addArrangedSubview(counterLabel)

        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: topAnchor),
            horizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    func setupRecommendedLabel() {
        recommendedLabel.font = Constants.labelFont
        recommendedLabel.textColor = Constants.labelFontColor
        recommendedLabel.textAlignment = .left
    }

    func setupCounterLabel() {
        counterLabel.font = Constants.labelFont
        counterLabel.textColor = Constants.labelFontColor
        counterLabel.textAlignment = .right
    }
}
