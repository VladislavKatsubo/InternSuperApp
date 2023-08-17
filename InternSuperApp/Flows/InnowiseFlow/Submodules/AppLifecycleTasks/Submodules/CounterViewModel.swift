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
    func appDidEnterBackground()
    func appWillEnterForeground()
}

final class CounterViewModel: CounterViewModelProtocol {

    typealias Constants = CounterResources.Constants.Mocks

    private let context: AppContext
    private let handlers: CounterResources.Handlers
    private let dataService: AppCounterProtocol

    var onStateChange: ((CounterResources.State) -> Void)?
    var backgroundTimestamp: Date?

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

    func appDidEnterBackground() {
        backgroundTimestamp = Date()

        updateCounter(by: Constants.updateValueForEnterBackground)
    }

    func appWillEnterForeground() {
        guard let backgroundTimestamp = backgroundTimestamp else { return }

        let timeDifference = Date().timeIntervalSince(backgroundTimestamp) / 60
        updateCounter(by: Constants.updateValueForEnterForeground)

        guard timeDifference >= 1 else { return }
        updateCounter(by: Constants.negativeTimeDifferenceMultiplier * CGFloat(timeDifference))
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

    func updateCounter(by value: CGFloat) {
        guard var counterValue: CGFloat = dataService.getCounterValue() else { return }
        counterValue += value
        dataService.setCounterValue(with: counterValue)

        onStateChange?(.onUpdateCounter(counterValue))
    }
}
