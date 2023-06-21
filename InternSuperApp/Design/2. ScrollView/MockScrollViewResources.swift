//
//  MockScrollViewResources.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 21.06.23.
//

import UIKit

struct MockScrollViewResources {
    // MARK: - Constants
    enum Constants {
        enum UI {
            static let colors: [UIColor] = .init(
                [
                    .systemRed,
                    .systemYellow,
//                    .systemPurple // Use it to test the case where there is more content than can fit on the screen.
                ]
            )

            static let buttonText: String = "Button"
            static let buttonColor: UIColor = .systemGreen
            static let buttonTextColor: UIColor = .white

            static let scrollViewOffset: CGFloat = 20.0
            static let scrollViewInset: CGFloat = -20.0

            static let stackViewSpacing: CGFloat = 25.0

            static let buttonTopOffset: CGFloat = 25.0
        }

        enum Mocks {

        }
    }
}
