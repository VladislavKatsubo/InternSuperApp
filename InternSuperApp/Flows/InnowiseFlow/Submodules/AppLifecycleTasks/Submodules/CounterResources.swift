//
//  CounterResources.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 16.08.23.
//

import UIKit

struct CounterResources {
    // MARK: - Handlers
    struct Handlers {
        let onUpdateCounterView: () -> Void
    }

    // MARK: - States
    enum State {
        case onUpdateCounter(CGFloat)
    }

    // MARK: - Constants
    enum Constants {

        enum UI {
            static let title: String = "CounterView"
            static let counterViewWidthMultiplier: CGFloat = 0.90
        }

        enum Mocks {
            static let updateValueForEnterBackground: CGFloat = 5.0
            static let updateValueForEnterForeground: CGFloat = 2.0
            static let negativeTimeDifferenceMultiplier: CGFloat = -2.0
        }
    }
}
