//
//  InnowiseTasksResources.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 23.07.23.
//

import UIKit

struct InnowiseTasksResources {
    // MARK: - Handlers
    struct Handlers {
        struct Design {
            let onCenteringElements: () -> Void
            let onScrollView: () -> Void
            let onHorizontalStackViewRelativeSizes: () -> Void
            let onEyeDropper: () -> Void
            let onCustomLayout: () -> Void
            let onDynamicUIChanges: () -> Void
            let onCompoundView: () -> Void
            let onCircularProgressBar: () -> Void
        }
        struct Lists {
            let onTabBarController: () -> Void
        }
    }

    // MARK: - States
    enum State {
        case onTaskSectionsTableView([IInnowiseTaskSection])
    }

    // MARK: - Constants
    enum Constants {
        enum UI {

        }

        enum Mocks {
            
        }
    }
}
