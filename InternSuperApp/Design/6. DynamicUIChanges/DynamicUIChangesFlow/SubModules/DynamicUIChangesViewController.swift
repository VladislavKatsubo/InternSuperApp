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

    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
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
        Constants.Buttons.allCases.forEach({ btn in
            let button = AnimatedGradientButton()
            button.configure(with: btn.title)

            stackView.addArrangedSubview(button)

            button.onTap = { [weak self] in
                self?.navigationController?.pushViewController(btn.vc, animated: true)
            }

            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: btn.width),
                button.heightAnchor.constraint(equalToConstant: btn.height)
            ])
        })
    }
}
