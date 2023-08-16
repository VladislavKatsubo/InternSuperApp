//
//  CircularProgressBarResources.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 7.07.23.
//

import UIKit

struct CircularProgressBarResources {
    // MARK: - Handlers
    struct Handlers {

    }
    
    // MARK: - State
    enum State {
        case onRandomizeAnimation((TimeInterval, CGFloat, Bool))
    }

    // MARK: - Constants
    enum Constants {
        enum UI {
            static let title: String = "8. Circular progress bar"
            static let smoothProgressAnimateButtonText: String = "Animate smoothly*"
            static let zeroBasedProgressAnimateButtonText: String = "Animate zero based*"
            static let progressAnimateButtonWidth: CGFloat = 320.0
            static let progressAnimateButtonHeight: CGFloat = 50.0

            static let smoothAnimateProgressSubtitleText: String = "* .fromValue = current progress"
            static let zeroBasedAnimateProgressSubtitleText: String = "* .fromValue = .zero"
            static let subtitleLabelFont: UIFont = .systemFont(ofSize: 13.0, weight: .thin)
            static let subtitleLabelFontColor: UIColor = .gray

            static let progressAnimateButtonBackgroundColor: UIColor = .systemTeal

            static let verticalStackViewSpacing: CGFloat = 10.0
            static let verticalStackViewTopOffset: CGFloat = 30.0
            static let spacingAfterSmoothSubtitle: CGFloat = 20.0

            static let animationDuration: TimeInterval = 0.5

            static let circleViewWidthMultiplier: CGFloat = 0.65
            static let spacingAfterCircleView: CGFloat = 20.0
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
