//
//  DynamicUIChangesImageView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 5.07.23.
//

import UIKit

final class DynamicUIChangesImageView: UIImageView {

    private enum Constants {
        static let cornerRadius: CGFloat = 10.0
        static let imageViewSize: CGSize = .init(width: 300.0, height: 300.0)
    }

    private let activityIndicator = UIActivityIndicatorView()

    // MARK: - Lifecycle
    init() {
        super.init(frame: .zero)
        setupItems()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configure
    func configure(with image: UIImage?) {
        activityIndicator.stopAnimating()

        UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.image = image
        }, completion: nil)
    }
}

private extension DynamicUIChangesImageView {
    // MARK: - Private methods
    func setupItems() {
        self.contentMode = .scaleToFill
        self.layer.cornerRadius = Constants.cornerRadius
        clipsToBounds = true

        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: Constants.imageViewSize.width),
            self.heightAnchor.constraint(equalToConstant: Constants.imageViewSize.height)
        ])

        setupActivityIndicator()
    }

    func setupActivityIndicator() {
        addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.style = .large

        activityIndicator.startAnimating()

        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
