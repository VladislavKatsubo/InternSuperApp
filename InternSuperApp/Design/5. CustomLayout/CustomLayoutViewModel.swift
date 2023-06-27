//
//  CustomLayoutViewModel.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 22.06.23.
//

import Foundation

protocol CustomLayoutViewModelProtocol {
    var onStateChange: ((CustomLayoutResources.State) -> Void)? { get set }

    func launch()
    func reloadModels()
}

final class CustomLayoutViewModel: CustomLayoutViewModelProtocol {

    typealias Constants = CustomLayoutResources.Constants.Mocks

    var onStateChange: ((CustomLayoutResources.State) -> Void)?

    // MARK: - Public methods
    func launch() {
        setupModels()
    }

    func reloadModels() {
        setupOnCoverView()
        setupOnTitleLabel()
        setupOnIconProfileFollowView()
        setupOnRecommendationsCountView()
        setupOnStatisticView()
    }
}

private extension CustomLayoutViewModel {
    // MARK: - Private methods
    func setupModels() {
        setupOnCoverView()
        setupOnTitleLabel()
        setupOnIconProfileFollowView()
        setupOnRecommendationsCountView()
        setupOnStatisticView()
    }

    func setupOnCoverView() {
        let randomIndex = Int.random(in: 0..<Constants.coverViewImages.count)
        let randomImage = Constants.coverViewImages[randomIndex]
        onStateChange?(.onCoverView(randomImage))
    }

    func setupOnTitleLabel() {
        let randomIndex = Int.random(in: 0..<Constants.titleLabelTexts.count)
        let randomText = Constants.titleLabelTexts[randomIndex]
        onStateChange?(.onTitleLabel(randomText))
    }

    func setupOnIconProfileFollowView() {
        let randomIndex = Int.random(in: 0..<Constants.iconProfileModels.count)
        let randomModel = Constants.iconProfileModels[randomIndex]
        onStateChange?(.onIconProfileFollowView(randomModel))
    }

    func setupOnRecommendationsCountView() {
        let randomModel = Constants.randomRecommendationsCountViewModel()
        onStateChange?(.onRecommendationsCountView(randomModel))
    }

    func setupOnStatisticView() {
        let randomSymbolTextModels: [SymbolTextView.Model] = Constants.randomSymbolTextViewModels()
        let randomModel: StatisticsView.Model = .init(
            profileIconStackImages: Constants.profileIconStackImages.shuffled(),
            symbolTextModels: randomSymbolTextModels
        )
        onStateChange?(.onStatisticView(randomModel))
    }
}
