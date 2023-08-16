//
//  AlphaAddRemoveViewController.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 5.07.23.
//

import UIKit

final class AlphaAddRemoveViewController: DynamicUIChangesTaskViewController {

    typealias Constants = AlphaAddRemoveResources.Constants.UI

    private var viewModel: AlphaAddRemoveViewModelProtocol?

    // MARK: - Public methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
        setupViewModel()
    }

    // MARK: - Configure
    func configure(with viewModel: AlphaAddRemoveViewModelProtocol) {
        self.viewModel = viewModel
    }
}

private extension AlphaAddRemoveViewController {
    // MARK: - Private methods
    func setupViewModel() {
        viewModel?.onStateChange = { [weak self] state in
            guard let self = self else { return }

            switch state {
            case .onImageView(let image):
                self.setupImageView(with: image)
            }
        }
        viewModel?.launch()
    }

    func setupItems() {
        self.title = Constants.title
        self.setupPositiveActionButton(with: Constants.addButtonText) { [weak self] in
            self?.animateAlphaChange(change: .increase)
        }
        self.setupNegativeActionButton(with: Constants.removeButtonText) { [weak self] in
            self?.animateAlphaChange(change: .decrease)
        }
    }

    func animateAlphaChange(change: AlphaChange) {
        let animator = UIViewPropertyAnimator(duration: Constants.animationDuration, curve: .linear) {
            self.changeAlpha(change)
        }
        animator.startAnimation()
    }

    func changeAlpha(_ change: AlphaChange) {
        switch change {
        case .increase:
            if initialImageView.alpha < 1.0 {
                initialImageView.alpha += Constants.alphaChangeAmount
            } else {
                // TODO: Alert
                print("It is already opaque..Stop pressing that button!")
            }
        case .decrease:
            if initialImageView.alpha > 0.0 {
                initialImageView.alpha -= Constants.alphaChangeAmount
            } else {
                // TODO: Alert
                print("It is already invisible..Stop pressing that button!")
            }
        }
    }

    enum AlphaChange {
        case increase
        case decrease
    }
}
