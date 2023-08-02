//
//  DynamicUIChangesViewModel.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 28.06.23.
//

import Foundation

protocol DynamicUIChangesViewModelProtocol {
    var onStateChange: ((DynamicUIChangesResources.State) -> Void)? { get set }

    func launch()
    func didTap(at type: DynamicUIChangesResources.Constants.UI.UIChangeType)
}

final class DynamicUIChangesViewModel: DynamicUIChangesViewModelProtocol {

    typealias Constants = DynamicUIChangesResources.Constants.Mocks

    private let handlers: DynamicUIChangesResources.Handlers

    var onStateChange: ((DynamicUIChangesResources.State) -> Void)?

    // MARK: - Init
    init(handlers: DynamicUIChangesResources.Handlers) {
        self.handlers = handlers
    }

    // MARK: - Public methods
    func launch() {
        setupModels()
    }

    func didTap(at type: DynamicUIChangesResources.Constants.UI.UIChangeType) {
        switch type {
        case .hideShow: self.handlers.onHideShow()
        case .addRemove: self.handlers.onAddRemove()
        case .alphaAddRemove: self.handlers.onAlphaAddRemove()
        }
    }
}

private extension DynamicUIChangesViewModel {
    // MARK: - Private methods
    func setupModels() {
        
    }
}
