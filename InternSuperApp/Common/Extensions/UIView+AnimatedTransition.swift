//
//  UIView+AnimatedTransition.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 27.06.23.
//

import UIKit

extension UIView {
    func animateTransition(duration: TimeInterval = 1.0, completion: ((Bool) -> Void)? = nil, animations: @escaping () -> Void) {
        UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve, animations: animations, completion: completion)
    }
}
