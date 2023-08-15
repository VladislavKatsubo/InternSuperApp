//
//  BlurringView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 28.06.23.
//

import UIKit

final class BlurringView: IView {

    private enum Constants {
        static let labelFont: UIFont = .systemFont(ofSize: 18.0, weight: .regular)
        static let labelFontColor: UIColor = .white
        static let labelText: String = "Hidden"
        static let eyeImage: UIImage? = UIImage(systemName: "eye.slash.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
    }

    private let visualEffectView = UIVisualEffectView()
    private let stackView = IStackView(axis: .horizontal)
    private let imageView = UIImageView()
    private let label = UILabel()

    // MARK: - Lifecycle
    override func didLoad() {
        setupItems()
    }
}

private extension BlurringView {
    // MARK: - Private methods
    func setupItems() {
        setupBlurring()
        setupStackView()
        setupImageView()
        setupLabel()
    }

    func setupBlurring() {
        addSubview(visualEffectView)

        let blurringEffect = UIBlurEffect(style: .regular)
        visualEffectView.effect = blurringEffect
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            visualEffectView.topAnchor.constraint(equalTo: topAnchor),
            visualEffectView.leadingAnchor.constraint(equalTo: leadingAnchor),
            visualEffectView.trailingAnchor.constraint(equalTo: trailingAnchor),
            visualEffectView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    func setupStackView() {
        insertSubview(stackView, aboveSubview: visualEffectView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    func setupImageView() {
        imageView.image = Constants.eyeImage
        imageView.contentMode = .scaleToFill
    }

    func setupLabel() {
        label.font = Constants.labelFont
        label.textColor = Constants.labelFontColor
        label.text = Constants.labelText
    }
}
