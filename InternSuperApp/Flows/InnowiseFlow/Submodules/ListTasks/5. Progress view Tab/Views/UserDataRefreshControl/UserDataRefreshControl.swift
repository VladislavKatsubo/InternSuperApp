//
//  UserDataRefreshControl.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 15.08.23.
//

import UIKit

final class UserDataRefreshControl: UIRefreshControl {

    private enum Constants {
        static let refreshControlColor: UIColor = .systemRed
        static let refreshControlTextAttributes:  [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 16),
            .foregroundColor: UIColor.systemRed
        ]
    }

    var onPull: (() -> Void)?

    // MARK: - Lifecycle
    override init() {
        super.init(frame: .zero)
        setupRefreshControl()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension UserDataRefreshControl {
    // MARK: - Private methods
    func setupRefreshControl() {
        self.tintColor = .systemRed
        self.attributedTitle = NSAttributedString(
            string: "Fetching Users ...",
            attributes: Constants.refreshControlTextAttributes
        )

        self.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
    }

    @objc
    func didPullToRefresh() {
        self.onPull?()
    }
}
