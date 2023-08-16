//
//  UpdateCounterViewModel.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 16.08.23.
//


import Foundation

protocol UpdateCounterViewModelProtocol {
    var onStateChange: ((UpdateCounterResources.State) -> Void)? { get set }

    func launch()
    func didTapUpdateButton()
    func didTapCancelButton()
}

final class UpdateCounterViewModel: UpdateCounterViewModelProtocol {

    typealias Constants = UpdateCounterResources.Constants.Mocks

    private let context: AppContext
    private let handlers: UpdateCounterResources.Handlers
    private let dataService: AppCounterProtocol

    var onStateChange: ((UpdateCounterResources.State) -> Void)?

    // MARK: - Init
    init(context: AppContext, handlers: UpdateCounterResources.Handlers) {
        self.context = context
        self.handlers = handlers
        self.dataService = context.appDataService
    }

    // MARK: - Public methods
    func launch() {

    }

    func didTapUpdateButton() {
        self.updateCounterValue()
        self.handlers.onBackAction()
    }

    func didTapCancelButton() {
        self.handlers.onBackAction()
    }

}

private extension UpdateCounterViewModel {
    // MARK: - Private methods
    func updateCounterValue() {
        guard var counterValue: CGFloat = dataService.getCounterValue() else {
            dataService.setCounterValue(with: Constants.counterValueForUpdate)
            return
        }
        counterValue += Constants.counterValueForUpdate
        dataService.setCounterValue(with: counterValue)
    }
}
