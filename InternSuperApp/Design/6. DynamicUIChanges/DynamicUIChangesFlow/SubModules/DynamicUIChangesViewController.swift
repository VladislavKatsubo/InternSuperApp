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
        setupHideShowButton()
        setupAddRemoveButton()
    }

    func setupStackView() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.addArrangedSubview(hideShowButton)
        stackView.addArrangedSubview(addRemoveButton)

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    func setupHideShowButton() {
        hideShowButton.configure(with: "Hide/Show")

        NSLayoutConstraint.activate([
            hideShowButton.widthAnchor.constraint(equalToConstant: 150.0),
            hideShowButton.heightAnchor.constraint(equalToConstant: 50.0)
        ])

        hideShowButton.onTap = { [weak self] in
            let vc = HideShowFactory().createController()
            
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }

    func setupAddRemoveButton() {
        addRemoveButton.configure(with: "Add/Remove")

        NSLayoutConstraint.activate([
            addRemoveButton.widthAnchor.constraint(equalToConstant: 150.0),
            addRemoveButton.heightAnchor.constraint(equalToConstant: 50.0)
        ])

        addRemoveButton.onTap = { [weak self] in
            let vc = AddRemoveFactory().createController()

            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
