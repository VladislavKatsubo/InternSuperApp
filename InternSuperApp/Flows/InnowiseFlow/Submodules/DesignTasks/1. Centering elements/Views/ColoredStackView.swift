//
//  ColoredStackView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 20.06.23.
//

import UIKit

final class ColoredStackView: IView {

    private enum Constants {
        static let stackViewSpacing: CGFloat = 25.0
        static let stackViewInset: CGFloat = 10.0

        static let containerBorderColor: CGColor = UIColor.systemGray3.cgColor
        static let containerBorderWidth: CGFloat = 1.0

        static let buttonText: String = "Button"
        static let buttonTextColor: UIColor = .white
    }

    private let stackView = IStackView(axis: .vertical, spacing: Constants.stackViewSpacing)
    private let centeredButton = CenteredButton()

    // MARK: - Lifecycle
    override func didLoad() {
        setupItems()
    }

    // MARK: - Configure
    func configure(with colors: [UIColor]) {
        self.setupColoredElements(with: colors)
    }
}

private extension ColoredStackView {
    // MARK: - Private methods
    func setupItems() {
        self.layer.borderWidth = Constants.containerBorderWidth
        self.layer.borderColor = Constants.containerBorderColor

        setupStackView()
        setupButton()
    }

    func setupStackView() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Constants.stackViewInset),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.stackViewInset),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.stackViewInset),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.stackViewInset)
        ])
    }

    func setupColoredElements(with colors: [UIColor]) {
        colors.forEach {
            let coloredElementView = ColoredElementView()
            coloredElementView.configure(with: $0)
            stackView.addArrangedSubview(coloredElementView)
        }
        stackView.addArrangedSubview(centeredButton)
    }

    func setupButton() {
        centeredButton.configure(with: Constants.buttonText, textColor: Constants.buttonTextColor)
    }
}
