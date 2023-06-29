//
//  HideShowViewController.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 28.06.23.
//

import UIKit

final class HideShowViewController: UIViewController {

    typealias Constants = HideShowResources.Constants.UI

    private let stackView = IStackView(axis: .vertical, spacing: 16.0)
    private let imageView = UIImageView()
    private let showButton = AnimatedGradientButton()
    private let hideButton = AnimatedGradientButton()

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
                self.imageView.image = image
            }
        }
        viewModel?.launch()
    }

    func setupItems() {
        view.backgroundColor = .systemBackground

        setupImageView()
        setupStackView()
        setupHideButton()
        setupShowButton()
    }

    func setupStackView() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.addArrangedSubview(hideButton)
        stackView.addArrangedSubview(showButton)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16.0),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0)
        ])
    }

    func setupImageView() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill

        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: Constants.imageViewSize.width),
            imageView.heightAnchor.constraint(equalToConstant: Constants.imageViewSize.height),
        ])
    }

    func setupHideButton() {
        hideButton.configure(with: Constants.hideButtonText)
        hideButton.onTap = { [weak self] in
            self?.addBlurringView(to: self?.imageView)
        }
    }

    func setupShowButton() {
        showButton.configure(with: Constants.showButtonText)
        showButton.onTap = { [weak self] in
            self?.imageView.subviews.forEach({
                $0.removeFromSuperview()
            })
        }
    }

    func addBlurringView(to view: UIView?) {
        guard let view = view else { return }

        let isAlreadyHidden = view.subviews.compactMap({
            $0 as? BlurringView
        }).isEmpty

        guard isAlreadyHidden else { return }

        let blurringView = BlurringView()
        blurringView.frame = view.bounds
        view.addSubview(blurringView)
    }
}
