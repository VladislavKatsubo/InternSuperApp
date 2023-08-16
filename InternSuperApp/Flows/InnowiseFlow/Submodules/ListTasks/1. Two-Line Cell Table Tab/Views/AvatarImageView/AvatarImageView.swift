//
//  AvatarImageView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 2.08.23.
//

import UIKit

final class AvatarImageView: IImageView {
    // MARK: - Constants
    private enum Constants {

    }

    private let imageView = UIImageView()
    private let activityIndicator = UIActivityIndicatorView(style: .medium)
    private var shape: Shape = .round {
        didSet {
            updateShape()
        }
    }

    // MARK: - Public methods
    override func didLoad() {
        super.didLoad()
        setupItems()
    }

    // MARK: - Configure
    func configure(with imageData: Data, shape: Shape) {
        self.imageView.image = UIImage(data: imageData)
        self.activityIndicator.stopAnimating()
        self.shape = shape
    }

    // MARK: - Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        updateShape()
    }

    // MARK: - Public methods
    func reset() {
        self.imageView.image = nil
        self.activityIndicator.startAnimating()
    }
}

private extension AvatarImageView {
    // MARK: - Private methods
    func setupItems() {
        setupImageView()
        setupActivityIndicator()
    }

    func setupImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    func setupActivityIndicator() {
        addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()

        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    func updateShape() {
        switch shape {
        case .round:
            self.layer.cornerRadius = bounds.width / 2.0
            self.layer.masksToBounds = true
        case .square:
            self.layer.cornerRadius = .zero
        }
    }
}

// MARK: - Shape
extension AvatarImageView {
    enum Shape {
        case round
        case square
    }
}
