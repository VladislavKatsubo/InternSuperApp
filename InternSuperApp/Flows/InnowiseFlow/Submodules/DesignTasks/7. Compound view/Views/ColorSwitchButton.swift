//
//  ColorSwitchButton.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 6.07.23.
//

import UIKit

final class ColorSwitchButton: IButton {

    private enum Constants {
        static let titleColor: UIColor = .gray
        static let labelFont: UIFont = .systemFont(ofSize: 18.0, weight: .regular)
    }

    // MARK: - Lifecycle
    override func didLoad() {
        super.didLoad()
        setupItems()
    }

    // MARK: - Configure
    func configure(with buttonTitleText: String?) {
        self.title = buttonTitleText
    }
}

private extension ColorSwitchButton {
    // MARK: - Private methods
    func setupItems() {
        self.titleLabel?.font = Constants.labelFont
        self.titleColor = Constants.titleColor
    }
}
