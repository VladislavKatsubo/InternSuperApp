//
//  ColoredCardCellViewModel.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 8.08.23.
//


import Foundation

protocol ColoredCardCellViewModelProtocol {
    var onStateChange: ((ColoredCardCellResources.State) -> Void)? { get set }

    func launch()
}

final class ColoredCardCellViewModel: ColoredCardCellViewModelProtocol {

    typealias Constants = ColoredCardCellResources.Constants.Mocks

    private let context: AppContext
    private let handlers: ColoredCardCellResources.Handlers

    var onStateChange: ((ColoredCardCellResources.State) -> Void)?

    // MARK: - Init
    init(context: AppContext, handlers: ColoredCardCellResources.Handlers) {
        self.context = context
        self.handlers = handlers
    }

    // MARK: - Public methods
    func launch() {
        setupModels()
    }
}

private extension ColoredCardCellViewModel {
    // MARK: - Private methods
    func setupModels() {
        setupColoredCollectionViewData()
    }

    func setupColoredCollectionViewData() {
        let cellModels: [ColoredCardCell.Model] = Constants.models.compactMap({
            .init(
                backgroundColor: $0.backgroundColor,
                categoryIcon: $0.iconImage,
                categoryName: $0.title
            )
        })

        onStateChange?(.onColoredCollectionView(cellModels))
    }
}
