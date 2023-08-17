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
        addNotificationObservers()
        setupViewModel()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeNotificationObservers()
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
        self.title = Constants.title
        self.view.backgroundColor = .systemBackground

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
            counterView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.counterViewWidthMultiplier),
        ])
    }
}

private extension CounterViewController {
    // MARK: - NotificationCenter
    func addNotificationObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(appDidEnterBackground),
            name: UIApplication.didEnterBackgroundNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(appWillEnterForeground),
            name: UIApplication.willEnterForegroundNotification,
            object: nil)
    }

    func removeNotificationObservers() {
        NotificationCenter.default.removeObserver(
            self,
            name: UIApplication.didEnterBackgroundNotification,
            object: nil
        )
        NotificationCenter.default.removeObserver(
            self,
            name: UIApplication.willEnterForegroundNotification,
            object: nil
        )
    }

    @objc
    func appDidEnterBackground() {
        self.viewModel?.appDidEnterBackground()
    }

    @objc
    func appWillEnterForeground() {
        self.viewModel?.appWillEnterForeground()
    }
}
