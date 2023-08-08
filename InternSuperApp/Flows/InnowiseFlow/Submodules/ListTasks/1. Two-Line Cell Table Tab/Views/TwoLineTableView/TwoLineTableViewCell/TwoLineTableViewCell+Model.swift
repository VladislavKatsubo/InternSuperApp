//
//  TwoLineTableViewCell+Model.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 2.08.23.
//

import UIKit

extension TwoLineTableViewCell {
    struct Model {
        let sex: User.Sex?
        let firstName: String?
        let lastName: String?
        let age: Int?
        let avatarImageURL: URL?
    }
}
