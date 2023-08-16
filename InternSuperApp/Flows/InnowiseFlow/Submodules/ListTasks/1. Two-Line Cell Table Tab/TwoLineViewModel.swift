//
//  TwoLineViewModel.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 2.08.23.
//


import UIKit

protocol TwoLineViewModelProtocol {
    var onStateChange: ((TwoLineResources.State) -> Void)? { get set }

    func launch()
}

final class TwoLineViewModel: TwoLineViewModelProtocol {

    typealias Constants = TwoLineResources.Constants.Mocks

    private let context: AppContext
    private let handlers: TwoLineResources.Handlers
    private let imageManager: ImageManagerProtocol

    var onStateChange: ((TwoLineResources.State) -> Void)?

    // MARK: - Init
    init(context: AppContext, handlers: TwoLineResources.Handlers) {
        self.context = context
        self.handlers = handlers
        self.imageManager = context.imageManager
    }

    // MARK: - Public methods
    func launch() {
        setupModels()
    }
}

private extension TwoLineViewModel {
    // MARK: - Private methods
    func setupModels() {
        setupTwoLineTableViewData()
    }

    func setupTwoLineTableViewData() {
        self.onStateChange?(.onTwoLineTableView(Constants.models, imageManager))
    }
}
