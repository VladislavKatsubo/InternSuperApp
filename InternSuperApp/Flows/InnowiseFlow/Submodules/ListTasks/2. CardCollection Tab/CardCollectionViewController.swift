//
//  CardCollectionViewController.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 7.08.23.
//

import UIKit

final class CardCollectionViewController: UIViewController {

    typealias Constants = CardCollectionResources.Constants.UI

    private let collectionView = CardCollectionView()

    private var viewModel: CardCollectionViewModelProtocol?

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
        setupViewModel()
    }

    // MARK: - Configure
    func configure(viewModel: CardCollectionViewModelProtocol) {
        self.viewModel = viewModel
    }
}

private extension CardCollectionViewController {
    // MARK: - Private methods
    func setupViewModel() {
        viewModel?.onStateChange = { [weak self] state in
            guard let self = self else { return }

            switch state {
            case .onCardCollectionView(let models, let imageManager):
                self.collectionView.configure(with: models, imageManager: imageManager)
            }
        }
        viewModel?.launch()
    }

    func setupItems() {
        view.backgroundColor = .systemBackground

        setupCardCollectionView()
    }

    func setupCardCollectionView() {
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
