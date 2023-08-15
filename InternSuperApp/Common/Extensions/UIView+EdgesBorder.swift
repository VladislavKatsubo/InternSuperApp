//
//  UIView+EdgesBorder.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 14.08.23.
//

import UIKit

extension UIView {
    func addBorder(edges: UIRectEdge, color: UIColor = .black, thickness: CGFloat = 1.0) {

        func borderLayer(with frame: CGRect) -> CALayer {
            let border = CALayer()
            border.frame = frame
            border.backgroundColor = color.cgColor
            return border
        }

        if edges.contains(.top) {
            self.layer.addSublayer(borderLayer(with: CGRect(x: 0, y: 0, width: self.frame.width, height: thickness)))
        }

        if edges.contains(.left) {
            self.layer.addSublayer(borderLayer(with: CGRect(x: 0, y: 0, width: thickness, height: self.frame.height)))
        }

        if edges.contains(.right) {
            self.layer.addSublayer(borderLayer(with: CGRect(x: self.frame.width - thickness, y: 0, width: thickness, height: self.frame.height)))
        }

        if edges.contains(.bottom) {
            self.layer.addSublayer(borderLayer(with: CGRect(x: 0, y: self.frame.height - thickness, width: self.frame.width, height: thickness)))
        }
    }
}
