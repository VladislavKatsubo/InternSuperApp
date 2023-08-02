//
//  IDesignTask.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 23.07.23.
//

enum IDesignTask: InnowiseTaskProtocol, Equatable, CaseIterable {
    case centeringElements
    case scrollViewWithPinnedButton
    case horizontalStackViewRelativeSizes
    case eyedropper
    case customLayout
    case dynamicUIChanges
    case compoundView
    case circularProgressBar

    var title: String {
        switch self {

        case .centeringElements: return "Centering elements"
        case .scrollViewWithPinnedButton: return "ScrollView with pinned button"
        case .horizontalStackViewRelativeSizes: return "Horizontal StackView w/ Relative Sizes"
        case .eyedropper: return "Eyedropper"
        case .customLayout: return "Custom Layout"
        case .dynamicUIChanges: return "Dynamic UI changes"
        case .compoundView: return "Compound View w/ colors"
        case .circularProgressBar: return "Circular progress bar"
        }
    }
}
