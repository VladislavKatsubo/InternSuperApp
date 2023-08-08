//
//  GroceryCategory.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 8.08.23.
//

import UIKit

enum GroceryCategory: CaseIterable {
    case fruits
    case vegetables
    case dairy
    case meats
    case fish
    case grains

    var title: String {
        switch self {
        case .fruits: return "Fruits"
        case .vegetables: return "Vegetables"
        case .dairy: return "Dairy"
        case .meats: return "Meats"
        case .fish: return "Fish"
        case .grains: return "Grains"
        }
    }

    var iconImage: UIImage {
        switch self {
        case .fruits: return UIImage(systemName: "apple.logo") ?? UIImage()
        case .vegetables: return UIImage(systemName: "carrot") ?? UIImage()
        case .dairy: return UIImage(systemName: "drop.fill") ?? UIImage()
        case .meats: return UIImage(systemName: "hare") ?? UIImage()
        case .fish: return UIImage(systemName: "fish") ?? UIImage()
        case .grains: return UIImage(systemName: "leaf") ?? UIImage()
        }
    }

    var backgroundColor: UIColor {
        switch self {
        case .fruits: return .systemOrange
        case .vegetables: return .systemGreen
        case .dairy: return .systemBrown
        case .meats: return .systemRed
        case .fish: return .systemBlue
        case .grains: return .systemYellow
        }
    }
}
