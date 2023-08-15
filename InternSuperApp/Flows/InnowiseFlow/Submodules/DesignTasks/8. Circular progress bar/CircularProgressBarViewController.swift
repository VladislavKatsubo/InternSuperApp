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
    private let verticalStackView = IStackView(axis: .vertical, spacing: Constants.verticalStackViewSpacing)
    private let smoothAnimateProgressButton = AnimateProgressButton()
    private let smoothSubtitle = UILabel()
    private let zeroBasedAnimateProgressButton = AnimateProgressButton()
    private let zeroBasedSubtitle = UILabel()

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

        setupVerticalStackView()
        setupCircleView()
        setupSmoothAnimateProgressButton()
        setupSmoothSubtitle()
        setupFromZeroAnimateProgressButton()
        setupZeroBasedSubtitle()
    }

    func setupVerticalStackView() {
        view.addSubview(verticalStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false

        verticalStackView.addArrangedSubview(circleView)
        verticalStackView.setCustomSpacing(Constants.spacingAfterCircleView, after: circleView)
        verticalStackView.addArrangedSubview(smoothAnimateProgressButton)
        verticalStackView.addArrangedSubview(smoothSubtitle)
        verticalStackView.setCustomSpacing(Constants.spacingAfterSmoothSubtitle, after: smoothSubtitle)
        verticalStackView.addArrangedSubview(zeroBasedAnimateProgressButton)
        verticalStackView.addArrangedSubview(zeroBasedSubtitle)

        NSLayoutConstraint.activate([
            verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    func setupCircleView() {
        circleView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            circleView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.circleViewWidthMultiplier),
            circleView.heightAnchor.constraint(equalTo: circleView.widthAnchor)
        ])
    }

    func setupSmoothAnimateProgressButton() {
        smoothAnimateProgressButton.configure(with: Constants.smoothProgressAnimateButtonText)

        smoothAnimateProgressButton.onTap = { [weak self] in
            self?.viewModel?.didTapAnimateProgressButton(fromZero: false)
        }

        NSLayoutConstraint.activate([
            smoothAnimateProgressButton.heightAnchor.constraint(equalToConstant: Constants.progressAnimateButtonHeight)
        ])
    }

    func setupSmoothSubtitle() {
        smoothSubtitle.text = Constants.smoothAnimateProgressSubtitleText
        smoothSubtitle.font = Constants.subtitleLabelFont
        smoothSubtitle.textColor = Constants.subtitleLabelFontColor
    }

    func setupFromZeroAnimateProgressButton() {
        zeroBasedAnimateProgressButton.configure(with: Constants.zeroBasedProgressAnimateButtonText)

        zeroBasedAnimateProgressButton.onTap = { [weak self] in
            self?.viewModel?.didTapAnimateProgressButton(fromZero: true)
        }

        NSLayoutConstraint.activate([
            zeroBasedAnimateProgressButton.heightAnchor.constraint(equalToConstant: Constants.progressAnimateButtonHeight)
        ])
    }

    func setupZeroBasedSubtitle() {
        zeroBasedSubtitle.text = Constants.zeroBasedAnimateProgressSubtitleText
        zeroBasedSubtitle.font = Constants.subtitleLabelFont
        zeroBasedSubtitle.textColor = Constants.subtitleLabelFontColor
    }
}
