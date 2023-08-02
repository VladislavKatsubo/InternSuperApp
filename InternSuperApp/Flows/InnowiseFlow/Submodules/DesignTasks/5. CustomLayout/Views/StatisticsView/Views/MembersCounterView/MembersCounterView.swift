//
//  MembersCounterView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 25.06.23.
//

import UIKit

final class MembersCounterView: IView {

    private enum Constants {
        static let labelFont: UIFont = .systemFont(ofSize: 12.0, weight: .regular)
        static let labelFontColor: UIColor = .white

        static let backgroundColor: UIColor = .systemGray2
    }

    private let counterLabel = UILabel()

    // MARK: - Lifecycle
    override func didLoad() {
        setupItems()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2.0
    }

    // MARK: - Configure
    func configure(with amount: Int) {
        self.counterLabel.text = "+" + String(amount)
    }
}

private extension MembersCounterView {
    // MARK: - Private methods
    func setupItems() {
        self.backgroundColor = .systemGray
        setupLabel()
    }

    func setupLabel() {
        addSubview(counterLabel)
        counterLabel.translatesAutoresizingMaskIntoConstraints = false
        counterLabel.font = Constants.labelFont
        counterLabel.textColor = .white

        NSLayoutConstraint.activate([
            counterLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            counterLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
