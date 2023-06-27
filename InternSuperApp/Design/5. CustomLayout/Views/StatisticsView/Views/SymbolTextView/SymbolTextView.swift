//
//  SymbolTextView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 24.06.23.
//

import UIKit

final class SymbolTextView: IView {

    private enum Constants {
        static let labelFont: UIFont = .systemFont(ofSize: 14.0, weight: .regular)
        static let labelFontColor: UIColor = .white
    }

    private let horizontalStackView = IStackView(axis: .horizontal, spacing: 2.5)
    private let symbolImageView = UIImageView()
    private let counterTextLabel = UILabel()

    // MARK: - Lifecycle
    override func didLoad() {
        setupItems()
    }

    // MARK: - Configure
    func configure(with model: Model) {
        horizontalStackView.arrangedSubviews.forEach { view in
            horizontalStackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }

        switch model.alignment {
        case .leadingSymbol:
            self.setupSymbolImageView(with: model.symbol)
            self.setupCounterTextLabel(with: model.counter)
        case .trailingSymbol:
            self.setupCounterTextLabel(with: model.counter)
            self.setupSymbolImageView(with: model.symbol)
        }
    }
}

private extension SymbolTextView {
    // MARK: - Private methods
    func setupItems() {
        setupStackView()
    }

    func setupStackView() {
        addSubview(horizontalStackView)
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: topAnchor),
            horizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    func setupSymbolImageView(with image: UIImage?) {
        symbolImageView.image = image
        symbolImageView.contentMode = .scaleAspectFit
        horizontalStackView.addArrangedSubview(symbolImageView)
    }

    func setupCounterTextLabel(with counter: Int?) {
        guard let counter = counter else { return }

        counterTextLabel.text = counter.abbreviated()
        counterTextLabel.font = Constants.labelFont
        counterTextLabel.textColor = Constants.labelFontColor

        horizontalStackView.addArrangedSubview(counterTextLabel)
    }
}
