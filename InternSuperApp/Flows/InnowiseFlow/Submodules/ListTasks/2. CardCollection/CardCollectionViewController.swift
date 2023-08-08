//
//  CardCollectionViewController.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 7.08.23.
//

import UIKit

final class CardCollectionViewController: UIViewController {

    typealias Constants = CardCollectionResources.Constants.UI

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

            }
        }
        viewModel?.launch()
    }

    func setupItems() {
        view.backgroundColor = .systemBackground

    }
}
