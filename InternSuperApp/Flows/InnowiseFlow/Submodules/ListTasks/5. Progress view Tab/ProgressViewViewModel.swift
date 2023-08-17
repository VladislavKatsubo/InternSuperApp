//
//  ProgressViewViewModel.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 15.08.23.
//


import Foundation

protocol ProgressViewViewModelProtocol {
    var onStateChange: ((ProgressViewResources.State) -> Void)? { get set }

    func launch()
    func didTapRefreshButton()
    func didPullToRefresh()
}

final class ProgressViewViewModel: ProgressViewViewModelProtocol {

    typealias Constants = ProgressViewResources.Constants.Mocks

    private let context: AppContext
    private let handlers: ProgressViewResources.Handlers
    private let imageManager: ImageManagerProtocol

    var onStateChange: ((ProgressViewResources.State) -> Void)?

    // MARK: - Init
    init(context: AppContext, handlers: ProgressViewResources.Handlers, imageManager: ImageManagerProtocol) {
        self.context = context
        self.handlers = handlers
        self.imageManager = imageManager
    }

    // MARK: - Public methods
    func launch() {
        setupModels()
    }

    func didTapRefreshButton() {
        onStateChange?(.onProgressViewTableViewRemoveData)
        onStateChange?(.onShowEmptyView(Constants.emptyViewModel))
    }

    func didPullToRefresh() {
        self.onStateChange?(.onHideEmptyView)
        self.setupProgressViewMockLoad(with: Constants.pullToRefreshDelay)
        self.setupProgressViewTableViewData(with: Constants.pullToRefreshDelay)
    }
}

private extension ProgressViewViewModel {
    // MARK: - Private methods
    func setupModels() {
        setupProgressViewMockLoad(with: Constants.initialLoadDelay)
        setupProgressViewTableViewData(with: Constants.initialLoadDelay)
    }

    func fetchUsers() -> [User] {
        Constants.fetchUsers()
    }

    func generateCellModels() -> [TwoLineTableViewCell.Model] {
        let users = fetchUsers()

        let models: [TwoLineTableViewCell.Model] = users.compactMap({
            .init(
                sex: $0.sex,
                firstName: $0.firstName,
                lastName: $0.lastName,
                age: $0.age,
                avatarImageURL: $0.squareAvatarUrl
            )
        })

        return models
    }

    func setupProgressViewTableViewData(with delay: TimeInterval) {
        let models = generateCellModels()

        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.onStateChange?(.onProgressViewTableViewData(models, self.imageManager))
        }
    }

    func setupProgressViewMockLoad(with delay: TimeInterval) {
        onStateChange?(.onMockLoad(delay))
    }
}
