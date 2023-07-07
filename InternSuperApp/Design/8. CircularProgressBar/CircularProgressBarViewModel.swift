//
//  CircularProgressBarViewModel.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 7.07.23.
//

import Foundation

protocol CircularProgressBarViewModelProtocol {
    var onStateChange: ((CircularProgressBarResources.State) -> Void)? { get set }

    func launch()
    func didTapAnimateProgressButton(fromZero: Bool)
}

final class CircularProgressBarViewModel: CircularProgressBarViewModelProtocol {
    typealias Constants = CircularProgressBarResources.Constants.Mocks

    var onStateChange: ((CircularProgressBarResources.State) -> Void)?

    // MARK: - Public methods
    func launch() {
        setupModels()
    }

    func didTapAnimateProgressButton(fromZero: Bool = false) {
        setupRandomDurationAndValueForProgressBarAnimation(fromZero: fromZero)
    }
}

private extension CircularProgressBarViewModel {
    // MARK: - Private methods
    func setupModels() {
        
    }

    func setupRandomDurationAndValueForProgressBarAnimation(fromZero: Bool) {
        onStateChange?(.onRandomizeAnimation((Constants.getRandomDuration(), Constants.getRandomValue(), fromZero)))
    }
}
