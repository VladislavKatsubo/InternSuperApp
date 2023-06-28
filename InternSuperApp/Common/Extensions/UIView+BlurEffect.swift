//
//  UIView+BlurEffect.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 28.06.23.
//

import UIKit

extension UIView {

    func applyBlurEffect() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = bounds
        blurredEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        addSubview(blurredEffectView)

        let eyeImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        eyeImageView.center = blurredEffectView.center
        eyeImageView.image = UIImage(systemName: "eye.slash.fill")
        eyeImageView.tintColor = .red
        blurredEffectView.contentView.addSubview(eyeImageView)

        let label = UILabel()
        label.text = "Hidden"
        label.textColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.sizeToFit()
        label.center = CGPoint(x: blurredEffectView.center.x, y: eyeImageView.frame.maxY + label.frame.height / 2 + 10)
        blurredEffectView.contentView.addSubview(label)
    }
}
