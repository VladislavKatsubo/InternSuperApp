//
//  ProgressViewTableView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 15.08.23.
//

import UIKit

final class ProgressViewTableView: TwoLineTableView {

    private let refreshControl = UserDataRefreshControl()

    override func didLoad() {
        super.didLoad()
        setupItems()
    }

    var onPullToRefresh: (() -> Void)?
}

private extension ProgressViewTableView {
    // MARK: - Private methods
    func setupItems() {
        setupRefreshControl()
    }

    func setupRefreshControl() {
        setRefreshControl(with: refreshControl)
        refreshControl.onPull = { [weak self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self?.onPullToRefresh?()
                self?.refreshControl.endRefreshing()
            }
        }
    }
}
