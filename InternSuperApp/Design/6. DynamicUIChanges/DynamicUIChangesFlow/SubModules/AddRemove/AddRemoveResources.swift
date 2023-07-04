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
            static let imageViewSize: CGSize = .init(width: 300.0, height: 300.0)
            static let addButtonText: String = "Add"
            static let removeButtonText: String = "Remove"
        }

        enum Mocks {
            static let randomImageURL: URL? = URL(string: "https://loremflickr.com/320/240")
        }
    }
}
