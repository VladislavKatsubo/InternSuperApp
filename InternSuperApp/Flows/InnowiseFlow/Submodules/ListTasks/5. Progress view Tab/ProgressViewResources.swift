//
//  ProgressViewResources.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 15.08.23.
//

import UIKit

struct ProgressViewResources {
    // MARK: - Handlers
    struct Handlers {

    }

    // MARK: - States
    enum State {
        case onMockLoad(TimeInterval)
        case onProgressViewTableViewData([TwoLineTableViewCell.Model], ImageManagerProtocol)
        case onProgressViewTableViewRemoveData
        case onShowEmptyView(ContentUnavailableView.Model)
        case onHideEmptyView
    }

    // MARK: - Constants
    enum Constants {

        enum UI {
            static let title: String = "Progress View"
        }

        enum Mocks {
            static func fetchUsers() -> [User] {
                UserFactory.generateUsers(30)
            }
            static let initialLoadDelay: TimeInterval = 6.0
            static let pullToRefreshDelay: TimeInterval = 3.0

            static let emptyViewTitleText: String = "No available Users"
            static let emptyViewSubtitleText: String = "Try pull to refresh"
            static let emptyViewIcon: UIImage? = UIImage(systemName: "person.2.slash.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.systemGray2)

            static let emptyViewModel: ContentUnavailableView.Model = .init(
                title: emptyViewTitleText,
                subtitle: emptyViewSubtitleText,
                icon: emptyViewIcon
            )
        }
    }
}
