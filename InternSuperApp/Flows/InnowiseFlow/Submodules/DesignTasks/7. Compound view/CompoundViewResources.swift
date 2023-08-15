//
//  CompoundViewResources.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 5.07.23.
//

import UIKit

struct CompoundViewResources {
    // MARK: - Handlers
    struct Handlers {

    }
    
    // MARK: - State
    enum State {
        case onColorView(UIColor?)
        case onChangeColor(Int)
        case onColorSwitcherView([String])
    }

    // MARK: - Constants
    enum Constants {
        enum UI {
            static let previousButtonText: String = "<"
            static let nextButtonText: String = ">"

            static let horizontalStackViewSpacing: CGFloat = 0.0

            static let animationDuration: TimeInterval = 0.5

            static let colorSwitchViewWidthMultiplier: CGFloat = 0.65
        }

        enum Mocks {
            enum Colors: Equatable, CaseIterable {
                case caribbeanCurrent
                case resedaGreen
                case carrotOrange
                case sunset
                case whiteSmoke
                case ashGray
                case asparagus
                case moonstone
                case celestialBlue
                case honeydew

                var color: UIColor {
                    switch self {
                    case .caribbeanCurrent: return .init(hexString: "08605f")
                    case .resedaGreen: return .init(hexString: "81804f")
                    case .carrotOrange: return .init(hexString: "f9a03f")
                    case .sunset: return .init(hexString: "f8ca99")
                    case .whiteSmoke: return .init(hexString: "f6f4f3")
                    case .ashGray: return .init(hexString: "acc4aa")
                    case .asparagus: return .init(hexString: "629460")
                    case .moonstone: return .init(hexString: "4b9baf")
                    case .celestialBlue: return .init(hexString: "33a1f")
                    case .honeydew: return .init(hexString: "d1dcc")
                    }
                }

                var title: String {
                    switch self {
                    case .caribbeanCurrent : return "Caribbean Current"
                    case .resedaGreen : return "Reseda green"
                    case .carrotOrange : return "Carrot orange"
                    case .sunset : return "Sunset"
                    case .whiteSmoke : return "White smoke"
                    case .ashGray : return "Ash gray"
                    case .asparagus : return "Asparagus"
                    case .moonstone : return "Moonstone"
                    case .celestialBlue : return "Celestial Blue"
                    case .honeydew : return "Honeydew"
                    }
                }
            }
        }
    }
}
