//
//  UpdateCounterResources.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 16.08.23.
//

import UIKit

struct UpdateCounterResources {
    // MARK: - Handlers
    struct Handlers {
        let onBackAction: () -> Void
    }

    // MARK: - States
    enum State {
        case onTitle(String)
    }

    // MARK: - Constants
    enum Constants {

        enum UI {
            static let updateButtonTitle: String = "Update"
            static let updateButtonBackgroundColor: UIColor = .systemGreen

            static let cancelButtonTitle: String = "Cancel"
            static let cancelButtonBackgroundColor: UIColor = .systemPink

            static let buttonWidthMultiplier: CGFloat = 0.5
        }

        enum Mocks {
            static let counterValueForUpdate: CGFloat = 10.0
            static let title: String = "UpdateCounter"
        }
    }
}
