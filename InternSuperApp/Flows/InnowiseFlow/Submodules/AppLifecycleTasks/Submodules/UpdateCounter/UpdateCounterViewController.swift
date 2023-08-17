//
//  UpdateCounterViewController.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 16.08.23.
//

import UIKit

final class UpdateCounterViewController: UIViewController {

    typealias Constants = UpdateCounterResources.Constants.UI

    private let stackView = IStackView(axis: .vertical, spacing: 10.0)
    private let updateButton = UpdateCounterViewButton()
    private let cancelButton = UpdateCounterViewButton()

    private var viewModel: UpdateCounterViewModelProtocol?

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
        setupViewModel()
    }

    // MARK: - Configure
    func configure(viewModel: UpdateCounterViewModelProtocol) {
        self.viewModel = viewModel
    }
}

private extension UpdateCounterViewController {
    // MARK: - Private methods
    func setupViewModel() {
        viewModel?.onStateChange = { [weak self] state in
            guard let self = self else { return }

            switch state {
            case .onTitle(let title):
                self.title = title
            }
        }
        viewModel?.launch()
    }

    func setupItems() {
        self.view.backgroundColor = .systemBackground

        setupStackView()
        setupUpdateButton()
        setupCancelButton()
    }

    func setupStackView() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.addArrangedSubview(updateButton)
        stackView.addArrangedSubview(cancelButton)

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    func setupUpdateButton() {
        updateButton.title = Constants.updateButtonTitle
        updateButton.backgroundColor = Constants.updateButtonBackgroundColor

        updateButton.onTap = { [weak self] in
            self?.viewModel?.didTapUpdateButton()
        }

        NSLayoutConstraint.activate([
            updateButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.buttonWidthMultiplier),
        ])
    }

    func setupCancelButton() {
        cancelButton.title = Constants.cancelButtonTitle
        cancelButton.backgroundColor = Constants.cancelButtonBackgroundColor

        cancelButton.onTap = { [weak self] in
            self?.viewModel?.didTapCancelButton()
        }

        NSLayoutConstraint.activate([
            cancelButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.buttonWidthMultiplier),
        ])
    }
}
