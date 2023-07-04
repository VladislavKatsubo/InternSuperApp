//
//  AddRemoveViewController.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 2.07.23.
//

import UIKit

// TODO: - Create common VC for this task with buttons and imageView
final class AddRemoveViewController: UIViewController {

    typealias Constants = AddRemoveResources.Constants.UI

    private let scrollView = UIScrollView(frame: .zero)
    private let horizontalStackView = IStackView(axis: .horizontal, spacing: 10.0)
    private let initialImageView = UIImageView()

    private let verticalStackView = IStackView(axis: .vertical, spacing: 16.0)
    private let addButton = AnimatedGradientButton()
    private let removeButton = AnimatedGradientButton()

    private var viewModel: AddRemoveViewModelProtocol?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
        setupModels()
    }

    // MARK: - Configure
    func configure(with viewModel: AddRemoveViewModelProtocol) {
        self.viewModel = viewModel
    }
}

private extension AddRemoveViewController {
    // MARK: - Private methods
    func setupModels() {
        viewModel?.onStateChange = { [weak self] state in
            guard let self = self else { return }

            switch state {
            case .onImageView(let image):
                self.initialImageView.image = image
            case .onAddImage(let image):
                self.appendImage(image)
            case .onRemoveImage:
                self.removeLastImage()
            }
        }
        viewModel?.launch()
    }

    func setupItems() {
        view.backgroundColor = .systemBackground

        setupScrollView()
        setupInitialImageView()
        setupHorizontalStackView()
        setupVerticalStackView()
        setupAddButton()
        setupRemoveButton()
    }

    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false

        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: Constants.imageViewSize.height),
        ])
    }

    func setupHorizontalStackView() {
        scrollView.addSubview(horizontalStackView)
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false

        horizontalStackView.addArrangedSubview(initialImageView)

        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            horizontalStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            horizontalStackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }

    func setupInitialImageView() {
        initialImageView.contentMode = .scaleToFill

        NSLayoutConstraint.activate([
            initialImageView.widthAnchor.constraint(equalToConstant: Constants.imageViewSize.width),
            initialImageView.heightAnchor.constraint(equalToConstant: Constants.imageViewSize.height),
        ])
    }

    func setupVerticalStackView() {
        view.addSubview(verticalStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false

        verticalStackView.addArrangedSubview(addButton)
        verticalStackView.addArrangedSubview(removeButton)

        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            verticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16.0),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0)
        ])
    }

    func setupAddButton() {
        addButton.configure(with: Constants.addButtonText)
        addButton.onTap = { [weak self] in
            self?.viewModel?.didTapAddButton()
        }
    }

    func setupRemoveButton() {
        removeButton.configure(with: Constants.removeButtonText)
        removeButton.onTap = { [weak self] in
            self?.viewModel?.didTapRemoveButton()
        }
    }

    func appendImage(_ image: UIImage?) {
        let nextImageView = UIImageView()
        nextImageView.image = image
        nextImageView.contentMode = .scaleToFill
        nextImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nextImageView.widthAnchor.constraint(equalToConstant: Constants.imageViewSize.width),
            nextImageView.heightAnchor.constraint(equalToConstant: Constants.imageViewSize.height),
        ])

        horizontalStackView.addArrangedSubview(nextImageView)
    }

    func removeLastImage() {
        guard horizontalStackView.subviews.count > 1 else {
            print("Removing initial image view is not allowed!")
            return
        }
        guard let lastAddedView = horizontalStackView.subviews.last else { return }

        horizontalStackView.removeArrangedSubview(lastAddedView)
        lastAddedView.removeFromSuperview()
    }
}
