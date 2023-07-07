//
//  CompoundViewViewModel.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 5.07.23.
//

import UIKit

protocol CompoundViewViewModelProtocol {
    var onStateChange: ((CompoundViewResources.State) -> Void)? { get set }

    func launch()
    func didTapPreviousButton()
    func didTapNextButton()
    func didSwipeColorSwitcher(with index: Int)
}

final class CompoundViewViewModel: CompoundViewViewModelProtocol {

    typealias Constants = CompoundViewResources.Constants.Mocks

    private var currentIndex = 0 {
        didSet {
            if currentIndex > Constants.Colors.allCases.count - 1 {
                currentIndex = 0
            } else if currentIndex < 0 {
                currentIndex = Constants.Colors.allCases.count - 1
            }
        }
    }

    var onStateChange: ((CompoundViewResources.State) -> Void)?

    // MARK: - Public methods
    func launch() {
        setupModels()
    }

    func didTapPreviousButton() {
        currentIndex -= 1
        changeColor()
    }

    func didTapNextButton() {
        currentIndex += 1
        changeColor()
    }

    func didSwipeColorSwitcher(with index: Int) {
        currentIndex = index
        changeColor()
    }
}

private extension CompoundViewViewModel {
    // MARK: - Private methods
    func setupModels() {
        setupColorSwitchView()
        setupColorSwitcherView()
    }

    func changeColor() {
        setupColorSwitchView()
        onStateChange?(.onChangeColor(currentIndex))
    }

    func setupColorSwitchView() {
        onStateChange?(.onColorView(Constants.Colors.allCases[currentIndex].color))
    }

    func setupColorSwitcherView() {
        let colorTitles = Constants.Colors.allCases.map({$0.title})
        onStateChange?(.onColorSwitcherView(colorTitles))
    }
}
