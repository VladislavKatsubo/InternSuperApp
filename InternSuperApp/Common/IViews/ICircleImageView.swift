//
//  ICircleImageView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 22.06.23.
//

import UIKit

class ICircleImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2.0
    }
}
