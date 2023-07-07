//
//  ColorSwitchView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 5.07.23.
//

import UIKit

final class ColorSwitchView: IView {

    private enum Constants {
        static let cornerRadius: CGFloat = 50.0
        static let borderSpacing: CGFloat = 16.0
        static let borderColor: UIColor = .systemGray4
        static let borderWidth: CGFloat = 1.0
        static let innerBorderWidth: CGFloat = 0.5

        static let shadowColor: UIColor = .gray
        static let shadowOffset: CGSize = CGSize(width: 1.0, height: 1.0)
        static let shadowOpacity: Float = 0.5
        static let shadowRadius: CGFloat = 5.0

        static let colorLayerShadowColor: UIColor = .darkGray
        static let colorLayerShadowOffset: CGSize = CGSize(width: 0.0, height: 0.0)
        static let colorLayerShadowOpacity: Float = 0.7
        static let colorLayerShadowRadius: CGFloat = 10.0

        static let colorChangeAnimationDuration: TimeInterval = 1.5
    }

    private let innerBorder = CALayer()
    private let outerBorder = CALayer()
    private let colorLayer = CALayer()

    // MARK: - Lifecycle
    override func didLoad() {
        setupItems()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updateLayerFrames()
    }

    // MARK: - Configure
    func configure(with color: UIColor?) {
        CATransaction.begin()
        CATransaction.setAnimationDuration(Constants.colorChangeAnimationDuration)
        colorLayer.backgroundColor = color?.cgColor
        CATransaction.commit()
    }
}

private extension ColorSwitchView {
    // MARK: - Private methods
    func setupItems() {
        self.layer.cornerRadius = Constants.cornerRadius
        self.backgroundColor = .white

        self.layer.addSublayer(outerBorder)
        self.layer.addSublayer(colorLayer)
        self.layer.addSublayer(innerBorder)

        setupOuterBorderLayer()
        setupInnerBorderLayer()
        setupShadow()
    }

    func setupOuterBorderLayer() {
        outerBorder.borderWidth = Constants.borderWidth
        outerBorder.borderColor = Constants.borderColor.cgColor
    }

    func setupInnerBorderLayer() {
        innerBorder.borderWidth = Constants.innerBorderWidth
        innerBorder.borderColor = Constants.borderColor.cgColor
    }

    func updateLayerFrames() {
        outerBorder.frame = self.bounds
        innerBorder.frame = self.bounds.insetBy(dx: Constants.borderSpacing, dy: Constants.borderSpacing)
        colorLayer.frame = innerBorder.frame

        outerBorder.cornerRadius = Constants.cornerRadius
        innerBorder.cornerRadius = Constants.cornerRadius - Constants.borderSpacing
        colorLayer.cornerRadius = Constants.cornerRadius - Constants.borderSpacing
    }

    func setupShadow() {
        self.layer.shadowColor = Constants.shadowColor.cgColor
        self.layer.shadowOffset = Constants.shadowOffset
        self.layer.shadowOpacity = Constants.shadowOpacity
        self.layer.shadowRadius = Constants.shadowRadius

        colorLayer.shadowColor = Constants.colorLayerShadowColor.cgColor
        colorLayer.shadowOffset = Constants.colorLayerShadowOffset
        colorLayer.shadowOpacity = Constants.colorLayerShadowOpacity
        colorLayer.shadowRadius = Constants.colorLayerShadowRadius
    }
}
