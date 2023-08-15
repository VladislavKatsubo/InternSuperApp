//
//  AlphaAddRemoveResources.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 5.07.23.
//

import UIKit

struct AlphaAddRemoveResources {
    // MARK: - State
    enum State {
        case onImageView(UIImage?)
    }

    // MARK: - Constants
    enum Constants {
        enum UI {
            static let imageViewSize: CGSize = .init(width: 300.0, height: 300.0)
            static let addButtonText: String = "Add"
            static let removeButtonText: String = "Remove"

            static let alphaChangeAmount: CGFloat = 0.1
            static let animationDuration: TimeInterval = 0.3
        }

        enum Mocks {
            static let randomImageURL: URL? = URL(string: "https://loremflickr.com/320/240")
        }
    }
}
