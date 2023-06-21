//
//  MockBlockView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 21.06.23.
//

import UIKit

final class MockBlockView: IView {

    private enum Constants {

    }

    // MARK: - Lifecycle
    override func didLoad() {
        setupItems()
    }

    // MARK: - Configure
    func configure(with color: UIColor) {
        self.backgroundColor = color
    }
}

private extension MockBlockView {
    // MARK: - Private methods
    func setupItems() {
        
    }
}
