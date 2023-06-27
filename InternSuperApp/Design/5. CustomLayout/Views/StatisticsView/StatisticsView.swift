//
//  StatisticsView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 25.06.23.
//

import UIKit

final class StatisticsView: IView {

    private enum Constants {

    }

    private let stackView = IStackView(axis: .horizontal, spacing: 10.0)
    private let profileIconsStackView = IconsStackView()
    private let horizontalStackView = IStackView(axis: .horizontal, spacing: 15.0)

    // MARK: - Lifecycle
    override func didLoad() {
        setupItems()
    }

    // MARK: - Configure
    func configure(with model: Model) {
        self.cleanup()
        self.profileIconsStackView.configure(with: model.profileIconStackImages)
        self.addSymbolTextViews(with: model.symbolTextModels)
    }
}

private extension StatisticsView {
    // MARK: - Private methods
    func setupItems() {
        setupStackView()
    }

    func cleanup() {
        horizontalStackView.arrangedSubviews.forEach { view in
            horizontalStackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }

    func setupStackView() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(profileIconsStackView)
        stackView.addArrangedSubview(horizontalStackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    func addSymbolTextViews(with models: [SymbolTextView.Model]) {
        models.forEach({
            let symbolTextView = SymbolTextView()
            symbolTextView.configure(with: $0)
            symbolTextView.translatesAutoresizingMaskIntoConstraints = false

            horizontalStackView.addArrangedSubview(symbolTextView)
        })
    }
}
