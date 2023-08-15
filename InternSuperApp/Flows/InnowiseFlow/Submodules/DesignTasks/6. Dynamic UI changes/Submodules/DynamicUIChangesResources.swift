//
//  DynamicUIChangesResources.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 28.06.23.
//

import UIKit

struct DynamicUIChangesResources {
    // MARK: - Handlers
    struct Handlers {
        let onHideShow: () -> Void
        let onAddRemove: () -> Void
        let onAlphaAddRemove: () -> Void
    }

    // MARK: - States
    enum State {

    }

    // MARK: - Constants
    enum Constants {
        enum UI {
            static let stackViewSpacing: CGFloat = 15.0

            enum UIChangeType: Equatable, CaseIterable {
                case hideShow
                case addRemove
                case alphaAddRemove

                var title: String {
                    switch self {
                    case .hideShow: return "Hide/Show"
                    case .addRemove: return "Add/Remove"
                    case .alphaAddRemove: return "Alpha Add/Remove"
                    }
                }

                var width: CGFloat {
                    return 200.0
                }

                var height: CGFloat {
                    return 50.0
                }
            }
        }

        enum Mocks {

        }
    }
}
