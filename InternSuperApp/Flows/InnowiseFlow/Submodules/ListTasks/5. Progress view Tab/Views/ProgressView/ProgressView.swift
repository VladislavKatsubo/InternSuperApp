//
//  ProgressView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 15.08.23.
//

import UIKit

final class ProgressView: IView {

    private enum Constants {
        static let progressViewHeight: CGFloat = 5.0
        static let progressViewWidthMultiplier: CGFloat = 0.75
    }

    private let progressView = UIProgressView(progressViewStyle: .bar)

    // MARK: - Lifecycle
    override func didLoad() {
        super.didLoad()
        setupItems()
    }

    // MARK: - Configure
    func configure(with loadTime: TimeInterval) {
        startSmoothAnimation(duration: loadTime)
    }
}

private extension ProgressView {
    // MARK: - Private methods
    func setupItems() {
        self.backgroundColor = .secondarySystemBackground
        setupProgressLabel()
    }

    func setupProgressLabel() {
        addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.trackTintColor = .systemGray2
        progressView.progressTintColor = .systemRed

        NSLayoutConstraint.activate([
            progressView.centerYAnchor.constraint(equalTo: centerYAnchor),
            progressView.centerXAnchor.constraint(equalTo: centerXAnchor),
            progressView.heightAnchor.constraint(equalToConstant: Constants.progressViewHeight),
            progressView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: Constants.progressViewWidthMultiplier)
        ])
    }

    func startSmoothAnimation(duration: TimeInterval) {
        progressView.progress = 0.0

        UIView.animate(withDuration: 0.0, animations: {
            self.progressView.layoutIfNeeded()
        }, completion: { _ in
            self.progressView.progress = 1.0

            UIView.animate(withDuration: duration, delay: 0.0, options: [.curveLinear], animations: {
                self.progressView.layoutIfNeeded()
            })
        })
    }
}
