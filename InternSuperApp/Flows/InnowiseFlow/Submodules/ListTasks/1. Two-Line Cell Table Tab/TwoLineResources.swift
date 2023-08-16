//
//  TwoLineResources.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 2.08.23.
//

import UIKit

struct TwoLineResources {
    // MARK: - Handlers
    struct Handlers {

    }

    // MARK: - States
    enum State {
        case onTwoLineTableView([TwoLineTableViewCell.Model], ImageManagerProtocol)
    }

    // MARK: - Constants
    enum Constants {

        enum UI {
            static let title: String = "Two-Line"
        }

        enum Mocks {
            static let models: [TwoLineTableViewCell.Model] = UserFactory.generateUsers(30).compactMap({
                .init(
                    sex: $0.sex,
                    firstName: $0.firstName,
                    lastName: $0.lastName,
                    age: $0.age,
                    avatarImageURL: $0.squareAvatarUrl
                )
            })
        }
    }
}
