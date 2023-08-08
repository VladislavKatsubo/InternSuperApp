//
//  CardCollectionViewCell+Model.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 7.08.23.
//

import Foundation

extension CardCollectionViewCell {
    struct Model {
        let firstName: String?
        let lastName: String?
        let age: Int?
        let description: String?
        let sex: User.Sex?
        let avatarImageURL: URL?
    }
}
