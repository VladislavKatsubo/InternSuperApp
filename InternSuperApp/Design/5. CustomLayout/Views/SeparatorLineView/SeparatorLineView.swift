//
//  SeparatorLineView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 24.06.23.
//

import UIKit

final class SeparatorLineView: IView {

    private enum Constants {
        static let lineLayerFillColor: UIColor = .systemGray2
    }

    private let lineLayer = CAShapeLayer()

    // MARK: - Lifecycle
    override func didLoad() {
        setupItems()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupLineLayer()
    }
}

private extension SeparatorLineView {
    // MARK: - Private methods
    func setupItems() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 1.0)
        ])

        setupLineLayer()
    }

    func setupLineLayer() {
        let roundedLinePath = UIBezierPath(
            roundedRect: .init(
                x: .zero,
                y: .zero,
                width: bounds.width,
                height: bounds.height
            ),
            cornerRadius: bounds.height / 2
        )
        lineLayer.path = roundedLinePath.cgPath
        lineLayer.fillColor = Constants.lineLayerFillColor.cgColor.copy(alpha: 0.2)
        self.layer.addSublayer(lineLayer)
    }
}
