//
//  CustomLayoutResources.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 22.06.23.
//

import UIKit

struct CustomLayoutResources {
    // MARK: - Constants
    enum Constants {
        enum UI {

        }

        enum Mocks {
            static let coverViewImage: UIImage? = UIImage.init(named: "hyundai")
            static let coverViewTitle: String = "New Hyndai Car New Hyndai Car New Hyndai Car New Hyndai Car New Hyndai Car"

            static let iconProfileModel: IconProfileFollowView.Model = .init(
                name: "Vladislav Katsubo",
                profileImage: #imageLiteral(resourceName: "vladislav_katsubo"),
                publishDate: .distantPast
            )
        }
    }
}


