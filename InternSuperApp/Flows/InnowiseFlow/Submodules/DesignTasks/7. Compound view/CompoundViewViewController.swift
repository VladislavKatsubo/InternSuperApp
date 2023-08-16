//
//  CompoundViewViewController.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 5.07.23.
//

import UIKit

final class CompoundViewViewController: UIViewController {

    typealias Constans = CompoundViewResources.Constants.UI

    private let colorSwitchView = ColorSwitchView()
    private let horizontalStackView = IStackView(axis: .horizontal, distribution: .fillProportionally, spacing: Constans.horizontalStackViewSpacing)
    private let nextColorSwitchButton = ColorSwitchButton()
    private let colorSwitcherView = ColorSwitcherView()
    private let previousColorSwitchButton = ColorSwitchButton()

    private var viewModel: CompoundViewViewModelProtocol?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
        setupViewModel()
    }

    // MARK: - Configure
    func configure(with viewModel: CompoundViewViewModelProtocol) {
        self.viewModel = viewModel
    }
}

private extension CompoundViewViewController {
    // MARK: - Private methods
    func setupViewModel() {
        viewModel?.onStateChange = { [weak self] state in
            guard let self = self else { return }

            switch state {
            case .onColorView(let color):
                self.colorSwitchView.configure(with: color)
            case .onChangeColor(var index):
                self.colorSwitcherView.changeColor(with: &index)
            case .onColorSwitcherView(let titles):
                self.colorSwitcherView.configure(with: titles)
            }
        }
        viewModel?.launch()
    }

    func setupItems() {
        self.navigationItem.largeTitleDisplayMode = .never
        self.title = Constans.title
        self.view.backgroundColor = .systemBackground
        
        setupColorSwitchView()
        setupHorizontalStackView()
        setupPreviousButton()
        setupColorSwitcherView()
        setupNextButton()
    }

    func setupColorSwitchView() {
        view.addSubview(colorSwitchView)
        colorSwitchView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            colorSwitchView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            colorSwitchView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colorSwitchView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constans.colorSwitchViewWidthMultiplier),
            colorSwitchView.heightAnchor.constraint(equalTo: colorSwitchView.widthAnchor)
        ])
    }

    func setupHorizontalStackView() {
        view.addSubview(horizontalStackView)
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false

        horizontalStackView.addArrangedSubview(previousColorSwitchButton)
        horizontalStackView.addArrangedSubview(colorSwitcherView)
        horizontalStackView.addArrangedSubview(nextColorSwitchButton)

        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: colorSwitchView.bottomAnchor),
            horizontalStackView.leadingAnchor.constraint(equalTo: colorSwitchView.leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: colorSwitchView.trailingAnchor)
        ])
    }

    func setupColorSwitcherView() {
        colorSwitcherView.onTap = { index in
            self.viewModel?.didSwipeColorSwitcher(with: index)
        }
    }

    func setupPreviousButton() {
        previousColorSwitchButton.configure(with: Constans.previousButtonText)
        
        previousColorSwitchButton.onTap = { [weak self] in
            self?.viewModel?.didTapPreviousButton()
        }
    }

    func setupNextButton() {
        nextColorSwitchButton.configure(with: Constans.nextButtonText)

        nextColorSwitchButton.onTap = { [weak self] in
            self?.viewModel?.didTapNextButton()
        }
    }
}
