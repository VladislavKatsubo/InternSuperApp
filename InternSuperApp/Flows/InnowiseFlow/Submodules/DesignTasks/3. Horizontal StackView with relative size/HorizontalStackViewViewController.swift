//
//  HorizontalStackViewViewController.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 21.06.23.
//

import UIKit

final class HorizontalStackViewViewController: UIViewController {

    typealias Constants = HorizontalStackViewResources.Constants.UI

    private let stackView = IStackView(axis: .horizontal)

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
        navigationItem.largeTitleDisplayMode = .never
    }
}

private extension HorizontalStackViewViewController {
    // MARK: - Private methods
    func setupItems() {
        self.view.backgroundColor = .systemBackground

        setupStackView()
        setupMockBlocks()
    }

    func setupStackView() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    func setupMockBlocks() {
        for (color, heightMultiplier, widthMultiplier) in Constants.colorHeightWidth {
            let mockBlock = IView()
            
            mockBlock.backgroundColor = color
            mockBlock.translatesAutoresizingMaskIntoConstraints = false

            stackView.addArrangedSubview(mockBlock)

            NSLayoutConstraint.activate([
                mockBlock.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: heightMultiplier),
                mockBlock.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: widthMultiplier)
            ])
        }
    }
}
