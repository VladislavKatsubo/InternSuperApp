//
//  CounterViewModel.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 16.08.23.
//


import Foundation

protocol CounterViewModelProtocol {
    var onStateChange: ((CounterResources.State) -> Void)? { get set }

    func launch()
    func didTapTransitionButton()
}

final class CounterViewModel: CounterViewModelProtocol {

    typealias Constants = CounterResources.Constants.Mocks

    private let context: AppContext
    private let handlers: CounterResources.Handlers
    private let dataService: AppCounterProtocol

    var onStateChange: ((CounterResources.State) -> Void)?

    // MARK: - Init
    init(context: AppContext, handlers: CounterResources.Handlers) {
        self.context = context
        self.handlers = handlers
        self.dataService = context.appDataService
    }

    // MARK: - Public methods
    func launch() {
        setupModels()
    }

    func didTapTransitionButton() {
        self.handlers.onUpdateCounterView()
    }
}

private extension CounterViewModel {
    // MARK: - Private methods
    func setupModels() {
        setupCounterViewData()
    }

    func setupCounterViewData() {
        guard let counterValue: CGFloat = dataService.getCounterValue() else { return }
        onStateChange?(.onUpdateCounter(counterValue))
    }
}
