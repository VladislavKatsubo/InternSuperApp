//
//  CardCellViewModel.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 7.08.23.
//


import Foundation

protocol CardCellViewModelProtocol {
    var onStateChange: ((CardCellResources.State) -> Void)? { get set }

    func launch()
}

final class CardCellViewModel: CardCellViewModelProtocol {

    typealias Constants = CardCellResources.Constants.Mocks

    private let context: AppContext
    private let imageManager: ImageManagerProtocol
    private let handlers: CardCellResources.Handlers

    var onStateChange: ((CardCellResources.State) -> Void)?

    // MARK: - Init
    init(context: AppContext, handlers: CardCellResources.Handlers, imageManager: ImageManagerProtocol) {
        self.context = context
        self.handlers = handlers
        self.imageManager = imageManager
    }

    // MARK: - Public methods
    func launch() {
        setupModels()
    }
}

private extension CardCellViewModel {
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
