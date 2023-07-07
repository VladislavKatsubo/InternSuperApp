//
//  CircularProgressBarResources.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 7.07.23.
//

import UIKit

struct CircularProgressBarResources {
    // MARK: - State
    enum State {
        case onRandomizeAnimation((TimeInterval, CGFloat, Bool))
    }

    // MARK: - Constants
    enum Constants {
        enum UI {
            static let smoothProgressAnimateButtonText: String = "Animate smoothly with Random Value"
            static let zeroBasedProgressAnimateButtonText: String = "Animate zero based with Random Value"
            static let progressAnimateButtonBackgroundColor: UIColor = .systemTeal

            static let horizontalStackViewSpacing: CGFloat = 0.0

            static let animationDuration: TimeInterval = 0.5

            static let circleViewWidthMultiplier: CGFloat = 0.65
        }

        enum Mocks {
            static func getRandomDuration() -> TimeInterval {
                TimeInterval.random(in: 0...10)
            }

            static func getRandomValue() -> CGFloat {
                CGFloat.random(in: 0.0...1.0)
            }
        }
    }
}
