//
//  CounterViewController.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 16.08.23.
//

import UIKit

final class CounterViewController: UIViewController {

    typealias Constants = CounterResources.Constants.UI

    private let counterView = CounterView()

    private var viewModel: CounterViewModelProtocol?

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
        setupViewModel()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupViewModel()
    }

    // MARK: - Configure
    func configure(viewModel: CounterViewModelProtocol) {
        self.viewModel = viewModel
    }
}

private extension CounterViewController {
    // MARK: - Private methods
    func setupViewModel() {
        viewModel?.onStateChange = { [weak self] state in
            guard let self = self else { return }

            switch state {
            case .onUpdateCounter(let value):
                self.counterView.configure(with: value)
            }
        }
        viewModel?.launch()
    }

    func setupItems() {
        view.backgroundColor = .systemBackground

        setupCounterView()
    }

    func setupCounterView() {
        view.addSubview(counterView)
        counterView.translatesAutoresizingMaskIntoConstraints = false

        counterView.onTap = { [weak self] in
            self?.viewModel?.didTapTransitionButton()
        }

        NSLayoutConstraint.activate([
            counterView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            counterView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            counterView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90),
        ])
    }
}
