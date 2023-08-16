//
//  AsimmetricCollectionViewController.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 14.08.23.
//

import UIKit

final class AsimmetricCollectionViewController: UIViewController {

    typealias Constants = AsimmetricCollectionResources.Constants.UI

    private let collectionView = AsimmetricCollectionView()

    private var viewModel: AsimmetricCollectionViewModelProtocol?

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
        setupViewModel()
    }

    // MARK: - Configure
    func configure(viewModel: AsimmetricCollectionViewModelProtocol) {
        self.viewModel = viewModel
    }
}

private extension AsimmetricCollectionViewController {
    // MARK: - Private methods
    func setupViewModel() {
        viewModel?.onStateChange = { [weak self] state in
            guard let self = self else { return }

            switch state {
            case .onCollectionViewData(let models):
                self.collectionView.configure(with: models)
            }
        }
        viewModel?.launch()
    }

    func setupItems() {
        self.title = Constants.title
        self.view.backgroundColor = .systemBackground

        setupCollectionView()
    }

    func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
