//
//  CircleView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 7.07.23.
//

import UIKit

final class CircleView: IView {

    private enum Constants {
        static let baseCircleLineWidth: CGFloat = 20.0
        static let baseCircleLayerStrokeColor: UIColor = UIColor.systemTeal.withAlphaComponent(0.5)
        static let progressCircleLayerStrokeColor: UIColor = UIColor.systemTeal
        static let fillColor: UIColor = UIColor.clear

        static let labelFont: UIFont = .systemFont(ofSize: 18.0, weight: .bold)
        static let labelFontColor: UIColor = .black
    }

    private let baseCircleLayer = CAShapeLayer()
    private let progressCircleLayer = CAShapeLayer()
    private let progressCounterLabel = UILabel()

    private var displayLink: CADisplayLink?
    private var fromValue: CGFloat = 0.0

    // MARK: - Lifecycle
    override func didLoad() {
        setupItems()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupBaseCircle()
        setupProgressCircle()
    }

    // MARK: - Public methods
    func progressAnimation(duration: TimeInterval, to value: CGFloat, fromZero: Bool = false) {
        let progressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        progressAnimation.fromValue = fromZero ? .zero : self.fromValue
        progressAnimation.duration = duration
        progressAnimation.toValue = value
        progressAnimation.fillMode = .forwards
        progressAnimation.isRemovedOnCompletion = false

        progressCircleLayer.add(progressAnimation, forKey: "progressAnimation")

        displayLink = CADisplayLink(target: self, selector: #selector(updateProgressCounterLabel))
        displayLink?.add(to: .main, forMode: .default)
    }
}

private extension CircleView {
    // MARK: - Private methods
    func setupItems() {

        addSublayers()
        setupProgressCounterLabel()
    }

    func addSublayers() {
        self.layer.addSublayer(baseCircleLayer)
        self.layer.addSublayer(progressCircleLayer)
    }

    func setupBaseCircle() {
        let circlePath = UIBezierPath(
            arcCenter: .init(x: bounds.midX, y: bounds.midY),
            radius: bounds.height / 2 - Constants.baseCircleLineWidth / 2,
            startAngle: .zero,
            endAngle: .pi * 2,
            clockwise: true
        )

        baseCircleLayer.path = circlePath.cgPath

        baseCircleLayer.fillColor = Constants.fillColor.cgColor
        baseCircleLayer.strokeColor = Constants.baseCircleLayerStrokeColor.cgColor
        baseCircleLayer.lineWidth = Constants.baseCircleLineWidth

        baseCircleLayer.frame = bounds
    }

    func setupProgressCircle() {
        let circlePath = UIBezierPath(
            arcCenter: .init(x: bounds.midX, y: bounds.midY),
            radius: bounds.height / 2 - Constants.baseCircleLineWidth / 2,
            startAngle: -(.pi / 2),
            endAngle: 3 * (.pi / 2),
            clockwise: true
        )

        progressCircleLayer.path = circlePath.cgPath
        progressCircleLayer.fillColor = Constants.fillColor.cgColor
        progressCircleLayer.strokeColor = Constants.progressCircleLayerStrokeColor.cgColor
        progressCircleLayer.strokeEnd = .zero
        progressCircleLayer.lineWidth = Constants.baseCircleLineWidth
        progressCircleLayer.lineCap = .round
        progressCircleLayer.frame = bounds
    }

    func setupProgressCounterLabel() {
        addSubview(progressCounterLabel)
        progressCounterLabel.translatesAutoresizingMaskIntoConstraints = false

        progressCounterLabel.font = Constants.labelFont
        progressCounterLabel.textColor = Constants.labelFontColor

        NSLayoutConstraint.activate([
            progressCounterLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            progressCounterLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    @objc
    private func updateProgressCounterLabel() {
        let progress = progressCircleLayer.presentation()?.strokeEnd ?? .zero
        fromValue = progress
        progressCounterLabel.text = String(format: "%.0f %%", progress * 100)

        if progress >= 1.0 {
            displayLink?.invalidate()
            displayLink = nil
        }
    }
}
