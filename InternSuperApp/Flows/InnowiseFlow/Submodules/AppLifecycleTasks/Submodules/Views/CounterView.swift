//
//  CounterView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 16.08.23.
//

import UIKit

final class CounterView: IView {

    private enum Constants {
        static let counterLabelFont: UIFont = .systemFont(ofSize: 26.0, weight: .bold)
        static let counterLabelFontColor: UIColor = .black
        static let counterLabelTopOffest: CGFloat = 20.0

        static let containerViewBackgroundColor: UIColor = .systemYellow

        static let transitionButtonBottomInset: CGFloat = -10.0
    }

    private let counterLabel = UILabel()
    private let transitionButton = IButton()

    var onTap: (() -> Void)?

    // MARK: - Lifecycle
    override func didLoad() {
        super.didLoad()
        setupItems()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        transitionButton.layer.cornerRadius = transitionButton.frame.height / 2
    }

    // MARK: - Configure
    func configure(with counterValue: CGFloat) {
        self.counterLabel.text = String(Int(counterValue))
        self.updateViewCornerRadius(with: counterValue)
    }
}

private extension CounterView {
    // MARK: - Private methods
    func setupItems() {
        self.backgroundColor = Constants.containerViewBackgroundColor
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalTo: self.heightAnchor)
        ])
        setupCounterLabel()
        setupTransitionButton()
    }
    
    func setupCounterLabel() {
        addSubview(counterLabel)
        counterLabel.translatesAutoresizingMaskIntoConstraints = false

        counterLabel.font = Constants.counterLabelFont
        counterLabel.textColor = Constants.counterLabelFontColor
        counterLabel.text = "0"


        NSLayoutConstraint.activate([
            counterLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.counterLabelTopOffest),
            counterLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    func setupTransitionButton() {
        addSubview(transitionButton)
        transitionButton.translatesAutoresizingMaskIntoConstraints = false

        transitionButton.title = "Tap"
        transitionButton.backgroundColor = .systemBlue

        transitionButton.onTap = { [weak self] in
            self?.onTap?()
        }

        NSLayoutConstraint.activate([
            transitionButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            transitionButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.transitionButtonBottomInset),
            transitionButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3),
            transitionButton.heightAnchor.constraint(equalTo: transitionButton.widthAnchor),
        ])
    }

    func updateViewCornerRadius(with cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
    }
}
