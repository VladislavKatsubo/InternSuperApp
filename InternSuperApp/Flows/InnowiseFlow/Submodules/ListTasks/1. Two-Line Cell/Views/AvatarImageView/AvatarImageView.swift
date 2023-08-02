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
    func configure(with imageData: UIImage, shape: Shape) {
        self.imageView.image = imageData
        self.shape = shape
    }

    // MARK: - Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        updateShape()
    }
}

private extension AvatarImageView {
    // MARK: - Private methods
    func setupItems() {
        setupImageView()
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

    func updateShape() {
        switch shape {
        case .round:
            self.layer.cornerRadius = bounds.width / 2.0
            self.layer.masksToBounds = true
        case .square:
            self.layer.cornerRadius = 0
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
