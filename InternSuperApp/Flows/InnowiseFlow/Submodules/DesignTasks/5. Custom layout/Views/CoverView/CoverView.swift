//
//  CoverView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 22.06.23.
//

import UIKit

final class CoverView: IView {

    private let imageView = UIImageView()
    private let gradientLayer = CAGradientLayer()

    // MARK: - Lifecycle
    override func didLoad() {
        setupItems()
    }

    // MARK: - Configure
    func configure(with image: UIImage?) {
        self.imageView.animateTransition { [weak self] in
            self?.imageView.image = image
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = .init(
            x: .zero,
            y: bounds.height * 0.7,
            width: bounds.width,
            height: bounds.height * 0.3
        )
    }
}

private extension CoverView {
    // MARK: - Private methods
    func setupItems() {
        setupImageView()
        setupGradientLayer()
    }

    func setupImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    func setupGradientLayer() {
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.black.cgColor
        ]

        gradientLayer.locations = [0.0, 1.0]
        layer.addSublayer(gradientLayer)
    }
}
