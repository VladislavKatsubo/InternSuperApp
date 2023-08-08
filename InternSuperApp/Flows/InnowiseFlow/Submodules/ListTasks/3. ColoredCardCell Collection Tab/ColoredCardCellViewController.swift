//
//  ColoredCardCellViewController.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 8.08.23.
//

import UIKit

final class ColoredCardCellViewController: UIViewController {

    typealias Constants = ColoredCardCellResources.Constants.UI

    private let collectionView = ColoredCardCellCollectionView()

    private var viewModel: ColoredCardCellViewModelProtocol?

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
        setupViewModel()
    }

    // MARK: - Configure
    func configure(viewModel: ColoredCardCellViewModelProtocol) {
        self.viewModel = viewModel
    }
}

private extension ColoredCardCellViewController {
    // MARK: - Private methods
    func setupViewModel() {
        viewModel?.onStateChange = { [weak self] state in
            guard let self = self else { return }

            switch state {
            case .onColoredCollectionView(let models):
                self.collectionView.configure(with: models)
            }
        }
        viewModel?.launch()
    }

    func setupItems() {
        view.backgroundColor = .systemBackground

        setupCollectionView()
    }

    func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
