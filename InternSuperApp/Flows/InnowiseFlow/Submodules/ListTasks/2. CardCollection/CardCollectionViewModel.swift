//
//  CardCollectionViewModel.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 7.08.23.
//


import Foundation

protocol CardCollectionViewModelProtocol {
    var onStateChange: ((CardCollectionResources.State) -> Void)? { get set }

    func launch()
}

final class CardCollectionViewModel: CardCollectionViewModelProtocol {

    typealias Constants = CardCollectionResources.Constants.Mocks

    private let context: AppContext
    private let handlers: CardCollectionResources.Handlers

    var onStateChange: ((CardCollectionResources.State) -> Void)?

    // MARK: - Init
    init(context: AppContext, handlers: CardCollectionResources.Handlers) {
        self.context = context
        self.handlers = handlers
    }

    // MARK: - Public methods
    func launch() {
        setupModels()
    }
}

private extension CardCollectionViewModel {
    // MARK: - Private methods
    func setupModels() {

    }
}
