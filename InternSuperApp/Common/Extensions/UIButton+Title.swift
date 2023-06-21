//
//  UIButton+Title.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 20.06.23.
//

import UIKit

extension UIButton {

    var title: String? {
        get {
            currentTitle
        }
        set {
            setTitle(newValue, for: .normal)
        }
    }

    var titleColor: UIColor? {
        get {
            currentTitleColor
        }
        set {
            setTitleColor(newValue, for: .normal)
        }
    }
}
