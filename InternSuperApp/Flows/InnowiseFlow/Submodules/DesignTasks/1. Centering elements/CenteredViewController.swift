//
//  CenteredViewController.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 20.06.23.
//

import UIKit

class CenteredViewController: UIViewController {

    typealias Constants = CenteredViewResources.Constants.UI

    private let coloredStackView = ColoredStackView()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
    }
}

private extension CenteredViewController {
    // MARK: - Private methods
    func setupItems() {
        self.navigationItem.largeTitleDisplayMode = .never
        self.title = Constants.title
        self.view.backgroundColor = .systemBackground
        
        setupColoredStackView()
        coloredStackView.configure(with: Constants.colors)
    }

    func setupColoredStackView() {
        view.addSubview(coloredStackView)
        coloredStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            coloredStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            coloredStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            coloredStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthMultiplier)
        ])
    }
}
