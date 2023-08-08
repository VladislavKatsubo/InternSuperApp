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
    private let imageManager: ImageManagerProtocol
    private let handlers: CardCollectionResources.Handlers

    var onStateChange: ((CardCollectionResources.State) -> Void)?

    // MARK: - Init
    init(context: AppContext, handlers: CardCollectionResources.Handlers) {
        self.context = context
        self.handlers = handlers
        self.imageManager = context.imageManager
    }

    // MARK: - Public methods
    func launch() {
        setupModels()
    }
}

private extension CardCollectionViewModel {
    // MARK: - Private methods
    func setupModels() {
        setupCardCollectionViewData()
    }

    func setupCardCollectionViewData() {
        let models = UserFactory.generateUsers(30)
        let cardCellModels: [CardCollectionViewCell.Model] = models.compactMap({
            .init(
                firstName: $0.firstName,
                lastName: $0.lastName,
                age: $0.age,
                description: $0.description,
                sex: $0.sex,
                avatarImageURL: $0.squareAvatarUrl
            )
        })

        onStateChange?(.onCardCollectionView(cardCellModels, imageManager))
    }
}
