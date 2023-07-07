//
//  CircularProgressBarViewController.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 7.07.23.
//

import UIKit

final class CircularProgressBarViewController: UIViewController {

    typealias Constants = CircularProgressBarResources.Constants.UI

    private let circleView = CircleView()

    private var viewModel: CircularProgressBarViewModelProtocol?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
        setupViewModel()
    }

    // MARK: - Configure
    func configure(with viewModel: CircularProgressBarViewModelProtocol) {
        self.viewModel = viewModel
    }
}

private extension CircularProgressBarViewController {
    // MARK: - Private methods
    func setupViewModel() {
        viewModel?.onStateChange = { [weak self] state in
            switch state {

            case .onRandomizeAnimation((let duration, let value, let fromZero)):
                self?.circleView.progressAnimation(duration: duration, to: value, fromZero: fromZero)
            }
        }
        viewModel?.launch()
    }
    func setupItems() {
        self.view.backgroundColor = .systemBackground

        setupCircleView()
        setupSmoothAnimateProgressButton()
        setupFromZeroAnimateProgressButton()
    }

    func setupCircleView() {
        view.addSubview(circleView)
        circleView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            circleView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.circleViewWidthMultiplier),
            circleView.heightAnchor.constraint(equalTo: circleView.widthAnchor)
        ])
    }

    func setupSmoothAnimateProgressButton() {
        let button = IButton()
        button.title = Constants.smoothProgressAnimateButtonText
        button.titleColor = Constants.progressAnimateButtonBackgroundColor.withAlphaComponent(0.8)
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .semibold)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 20.0
        button.layer.borderWidth = 3.0
        button.layer.borderColor = Constants.progressAnimateButtonBackgroundColor.cgColor
        button.onTap = { [weak self] in
            self?.viewModel?.didTapAnimateProgressButton(fromZero: false)
        }

        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: circleView.bottomAnchor, constant: 30.0),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 320.0),
            button.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }

    func setupFromZeroAnimateProgressButton() {
        let button = IButton()
        button.title = Constants.zeroBasedProgressAnimateButtonText
        button.titleColor = Constants.progressAnimateButtonBackgroundColor.withAlphaComponent(0.8)
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .semibold)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 20.0
        button.layer.borderWidth = 3.0
        button.layer.borderColor = Constants.progressAnimateButtonBackgroundColor.cgColor
        button.onTap = { [weak self] in
            self?.viewModel?.didTapAnimateProgressButton(fromZero: true)
        }

        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: circleView.bottomAnchor, constant: 100.0),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 320.0),
            button.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }
}
