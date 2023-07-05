//
//  AddRemoveViewController.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 2.07.23.
//

import UIKit

final class AddRemoveViewController: UIViewController {

    typealias Constants = AddRemoveResources.Constants.UI

    private let scrollView = UIScrollView(frame: .zero)
    private let horizontalStackView = IStackView(axis: .horizontal, spacing: Constants.horizontalStackViewSpacing)
    private let initialImageView = DynamicUIChangesImageView()

    private let verticalStackView = IStackView(axis: .vertical, spacing: Constants.verticalStackViewSpacing)
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
                self.initialImageView.configure(with: image)
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
            scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.scrollViewLeadingOffset),
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

    func setupVerticalStackView() {
        view.addSubview(verticalStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false

        verticalStackView.addArrangedSubview(addButton)
        verticalStackView.addArrangedSubview(removeButton)

        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.verticalStackViewLeadingOffset),
            verticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: Constants.verticalStackViewTrailingInset),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.verticalStackViewBottomInset)
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
        let nextImageView = DynamicUIChangesImageView()
        nextImageView.configure(with: image)
        nextImageView.translatesAutoresizingMaskIntoConstraints = false
        nextImageView.alpha = .zero

        NSLayoutConstraint.activate([
            nextImageView.widthAnchor.constraint(equalToConstant: Constants.imageViewSize.width),
            nextImageView.heightAnchor.constraint(equalToConstant: Constants.imageViewSize.height),
        ])

        horizontalStackView.addArrangedSubview(nextImageView)

        UIView.animate(withDuration: Constants.animationDuration, animations: {
            nextImageView.alpha = 1.0
        })
    }

    func removeLastImage() {
        guard horizontalStackView.subviews.count > 1 else {
            // TODO: Alert
            print("Removing initial image view is not allowed!")
            return
        }
        guard let lastAddedView = horizontalStackView.subviews.last else { return }

        UIView.animate(withDuration: Constants.animationDuration, animations: {
            lastAddedView.alpha = .zero
        }, completion: { _ in
            self.horizontalStackView.removeArrangedSubview(lastAddedView)
            lastAddedView.removeFromSuperview()
        })
    }
}
