//
//  UpdateCounterViewButton.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 16.08.23.
//

import UIKit

final class UpdateCounterViewButton: IButton {

    private enum Constants {
        static let cornerRadius: CGFloat = 8.0
        static let titleColor: UIColor = .white

        static let heightMultiplier: CGFloat = 0.25
    }

    // MARK: - Lifecycle
    override func didLoad() {
        super.didLoad()
        setupButton()
    }
}

private extension UpdateCounterViewButton {
    // MARK: - Private methods
    func setupButton() {
        self.layer.cornerRadius = Constants.cornerRadius
        self.titleColor = Constants.titleColor
        self.layer.cornerCurve = .continuous

        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: Constants.heightMultiplier)
        ])
    }
}
