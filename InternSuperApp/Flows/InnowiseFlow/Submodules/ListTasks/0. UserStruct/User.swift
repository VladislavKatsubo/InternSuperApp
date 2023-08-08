//
//  User.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 7.07.23.
//

import UIKit

struct User {
    let firstName: String?
    let lastName: String?
    let age: Int?
    let sex: Sex?
    let squareAvatarUrl: URL?
    let description: String?

    enum Sex: Equatable, CaseIterable {
        case female
        case male

        var userSexIcon: Character? {
            switch self {
            case .male: return "💃🏽"
            case .female: return "🕺"
            }
        }
    }
}
