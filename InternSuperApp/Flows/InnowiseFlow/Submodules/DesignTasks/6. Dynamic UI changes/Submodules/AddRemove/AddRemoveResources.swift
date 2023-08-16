//
//  AddRemoveResources.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 2.07.23.
//

import UIKit

struct AddRemoveResources {
    // MARK: - State
    enum State {
        case onImageView(UIImage?)
        case onAddImage(UIImage?)
        case onRemoveImage
    }

    // MARK: - Constants
    enum Constants {
        enum UI {
            static let title: String = "Add/Remove View"
            static let imageViewSize: CGSize = .init(width: 300.0, height: 300.0)
            static let addButtonText: String = "Add"
            static let removeButtonText: String = "Remove"

            static let horizontalStackViewSpacing: CGFloat = 10.0

            static let scrollViewLeadingOffset: CGFloat = 16.0

            static let verticalStackViewSpacing: CGFloat = 16.0
            static let verticalStackViewLeadingOffset: CGFloat = 16.0
            static let verticalStackViewTrailingInset: CGFloat = -16.0
            static let verticalStackViewBottomInset: CGFloat = -16.0

            static let animationDuration: TimeInterval = 0.5
        }

        enum Mocks {
            static let randomImageURL: URL? = URL(string: "https://loremflickr.com/320/240")

            static func randomImageUrl() -> URL? {
                let urlString = "https://loremflickr.com/320/240?random=\(UUID().uuidString)"
                return URL(string: urlString)
            }
        }
    }
}
