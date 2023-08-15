//
//  DynamicUIChangesViewController.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 28.06.23.
//

import UIKit

final class DynamicUIChangesViewController: UIViewController {

    typealias Constants = DynamicUIChangesResources.Constants.UI

    private let stackView = IStackView(axis: .vertical, spacing: Constants.stackViewSpacing)
    private let hideShowButton = AnimatedGradientButton()
    private let addRemoveButton = AnimatedGradientButton()
    private let alphaAddRemoveButton = AnimatedGradientButton()

    private var viewModel: DynamicUIChangesViewModelProtocol?

    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
    }

    // MARK: - Configure
    func configure(with viewModel: DynamicUIChangesViewModelProtocol) {
        self.viewModel = viewModel
    }
}

private extension DynamicUIChangesViewController {
    // MARK: - Private methods
    func setupItems() {
        view.backgroundColor = .systemBackground

        setupStackView()
        setupButtons()
    }

    func setupStackView() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    func setupButtons() {
        Constants.UIChangeType.allCases.forEach({ changeType in
            let button = AnimatedGradientButton()
            button.configure(with: changeType.title)

            stackView.addArrangedSubview(button)

            button.onTap = { [weak self] in
                self?.viewModel?.didTap(at: changeType)
            }

            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: changeType.width),
                button.heightAnchor.constraint(equalToConstant: changeType.height)
            ])
        })
    }
}
