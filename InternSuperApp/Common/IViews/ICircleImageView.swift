//
//  ICircleImageView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 22.06.23.
//

import UIKit

class ICircleImageView: UIImageView {

    // MARK: - Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.backgroundColor = UIColor.white.cgColor
        layer.cornerRadius = bounds.width / 2.0
    }
}
