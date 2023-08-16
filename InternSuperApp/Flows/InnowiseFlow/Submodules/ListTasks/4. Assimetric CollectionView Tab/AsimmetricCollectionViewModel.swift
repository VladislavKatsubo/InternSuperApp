//
//  AsimmetricCollectionViewModel.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 14.08.23.
//


import Foundation

protocol AsimmetricCollectionViewModelProtocol {
    var onStateChange: ((AsimmetricCollectionResources.State) -> Void)? { get set }

    func launch()
}

final class AsimmetricCollectionViewModel: AsimmetricCollectionViewModelProtocol {

    typealias Constants = AsimmetricCollectionResources.Constants.Mocks

    private let context: AppContext
    private let handlers: AsimmetricCollectionResources.Handlers

    var onStateChange: ((AsimmetricCollectionResources.State) -> Void)?

    // MARK: - Init
    init(context: AppContext, handlers: AsimmetricCollectionResources.Handlers) {
        self.context = context
        self.handlers = handlers
    }

    // MARK: - Public methods
    func launch() {
        setupModels()
    }
}

private extension AsimmetricCollectionViewModel {
    // MARK: - Private methods
    func setupModels() {
        setupCollectionViewModel()
    }

    func setupCollectionViewModel() {
        onStateChange?(.onCollectionViewData(Constants.allModels))
    }
}
