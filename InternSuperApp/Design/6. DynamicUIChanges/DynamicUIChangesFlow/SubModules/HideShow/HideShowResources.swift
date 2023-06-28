//
//  HideShowResources.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 28.06.23.
//

import UIKit

struct HideShowResources {
    // MARK: - State
    enum State {
        case onImageView(UIImage?)
    }

    // MARK: - Constants
    enum Constants {
        enum UI {
            static let imageViewSize: CGSize = .init(width: 300.0, height: 300.0)
            static let showButtonText: String = "Show"
            static let hideButtonText: String = "Hide"
        }

        enum Mocks {
            static let randomImageURL: URL? = URL(string: "https://loremflickr.com/320/240")
        }
    }
}

