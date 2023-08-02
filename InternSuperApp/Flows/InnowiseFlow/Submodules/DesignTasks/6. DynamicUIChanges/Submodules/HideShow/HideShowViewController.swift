//
//  HideShowViewController.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 28.06.23.
//

import UIKit

final class HideShowViewController: DynamicUIChangesTaskViewController {

    typealias Constants = HideShowResources.Constants.UI

    private var viewModel: HideShowViewModelProtocol?

    // MARK: - Configure
    func configure(with viewModel: HideShowViewModelProtocol) {
        self.viewModel = viewModel
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
        setupViewModel()
    }
}

private extension HideShowViewController {
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
        self.setupPositiveActionButton(with: Constants.showButtonText) { [weak self] in
            self?.initialImageView.subviews.forEach({
                $0.removeFromSuperview()
            })
        }

        self.setupNegativeActionButton(with: Constants.hideButtonText) { [weak self] in
            self?.addBlurringView(to: self?.initialImageView)
        }
    }

    func addBlurringView(to view: UIView?) {
        guard let view = view else { return }

        let isAlreadyHidden = view.subviews.compactMap({
            $0 as? BlurringView
        }).isEmpty

        guard isAlreadyHidden else {
            // TODO: Alert
            print("It is already hidden...Stop pressing that button!")
            return
        }

        let blurringView = BlurringView()
        blurringView.frame = view.bounds
        view.addSubview(blurringView)
    }
}
