//
//  CircleView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 7.07.23.
//

import Foundation

import UIKit

final class CircleView: IView {

    private enum Constants {

    }

    private let baseCircle = CAShapeLayer()
    private let progressCircle = CAShapeLayer()
    private let progressCounterLabel = UILabel()

    // MARK: - Lifecycle
    override func didLoad() {
        setupItems()
    }

    // MARK: - Configure
    func configure(with progress: CGFloat) {

    }
}

private extension CircleView {
    // MARK: - Private methods
    func setupItems() {


        setupBaseCircle()
        setupProgressCircle()
        setupProgressCounterLabel()
    }

    func setupBaseCircle() {
        let circlePath = UIBezierPath(
            arcCenter: <#T##CGPoint#>,
            radius: <#T##CGFloat#>,
            startAngle: <#T##CGFloat#>,
            endAngle: <#T##CGFloat#>,
            clockwise: <#T##Bool#>
        )
    }

    func setupProgressCircle() {

    }

    func setupProgressCounterLabel() {

    }
}
