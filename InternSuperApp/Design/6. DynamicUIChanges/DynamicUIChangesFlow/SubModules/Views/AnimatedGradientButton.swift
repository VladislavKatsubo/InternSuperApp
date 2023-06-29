//
//  AnimatedGradientButton.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 28.06.23.
//

import UIKit

final class AnimatedGradientButton: IButton {

    private enum Constants {
        static let cornerRadius: CGFloat = 10.0
        static let visualEffectAlpha: CGFloat = 0.8

        static let labelFont: UIFont = .systemFont(ofSize: 18.0, weight: .regular)
        static let labelFontColor: UIColor = .white
    }

    private let visualEffectView = UIVisualEffectView()
    private let gradientLayer = CAGradientLayer()

    private var gradientSet = [[CGColor]]()
    private var currentGradient: Int = 0

    private var isGradientLayerSet: Bool = false

    // MARK: - Configure
    func configure(with text: String) {
        self.title = text
    }

    // MARK: - Lifecycle
    override func didLoad() {
        super.didLoad()
        setupItems()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if !isGradientLayerSet {
            setupGradient()
            setupGradientLayer()
            animateGradientLayer()
            isGradientLayerSet = true
        }
    }
}

private extension AnimatedGradientButton {
    // MARK: - Private methods
    func setupItems() {
        setupButton()
        setupVisualEffect()
    }

    func setupButton() {
        self.backgroundColor = .clear

        self.layer.cornerRadius = Constants.cornerRadius
        self.layer.masksToBounds = true

        self.titleLabel?.font = Constants.labelFont
        self.titleColor = Constants.labelFontColor
    }

    func setupVisualEffect() {
        insertSubview(visualEffectView, at: 0)
        visualEffectView.isUserInteractionEnabled = false
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false

        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        visualEffectView.effect = blurEffect

        visualEffectView.layer.cornerRadius = Constants.cornerRadius
        visualEffectView.layer.masksToBounds = true
        visualEffectView.alpha = Constants.visualEffectAlpha

        NSLayoutConstraint.activate([
            visualEffectView.topAnchor.constraint(equalTo: topAnchor),
            visualEffectView.bottomAnchor.constraint(equalTo: bottomAnchor),
            visualEffectView.leadingAnchor.constraint(equalTo: leadingAnchor),
            visualEffectView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    func setupGradient() {
        let gradientOne = UIColor.systemBlue.cgColor
        let gradientTwo = UIColor.systemRed.cgColor
        let gradientThree = UIColor.systemGreen.cgColor

        gradientSet.append([gradientOne, gradientTwo])
        gradientSet.append([gradientTwo, gradientThree])
        gradientSet.append([gradientThree, gradientOne])
    }

    func setupGradientLayer() {
        gradientLayer.frame = bounds
        gradientLayer.colors = gradientSet[currentGradient]
        gradientLayer.startPoint = CGPoint(x:0, y:0)
        gradientLayer.endPoint = CGPoint(x:1, y:1)
        gradientLayer.drawsAsynchronously = true
        visualEffectView.layer.insertSublayer(gradientLayer, at: 0)
    }

    func animateGradientLayer() {
        if currentGradient < gradientSet.count - 1 {
            currentGradient += 1
        } else {
            currentGradient = 0
        }

        let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
        gradientChangeAnimation.duration = 5.0
        gradientChangeAnimation.toValue = gradientSet[currentGradient]
        gradientChangeAnimation.fillMode = CAMediaTimingFillMode.forwards
        gradientChangeAnimation.isRemovedOnCompletion = false
        gradientChangeAnimation.delegate = self
        gradientLayer.add(gradientChangeAnimation, forKey: "colors")
    }
}

extension AnimatedGradientButton: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            gradientLayer.colors = gradientSet[currentGradient]
            animateGradientLayer()
        }
    }
}
