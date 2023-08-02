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

    var onStateChange: ((TwoLineResources.State) -> Void)?

    // MARK: - Init
    init(context: AppContext, handlers: TwoLineResources.Handlers) {
        self.context = context
        self.handlers = handlers
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
        let users: [User] = [
            .init(
                firstName: "Vlad",
                lastName: "Katsubo",
                age: 27,
                sex: .male,
                squareAvatarUrl: .none,
                description: ""
            ),
            .init(
                firstName: "Vlad",
                lastName: "Katsubo",
                age: 27,
                sex: .male,
                squareAvatarUrl: .none,
                description: ""
            ),
            .init(
                firstName: "Vlad",
                lastName: "Katsubo",
                age: 27,
                sex: .male,
                squareAvatarUrl: .none,
                description: ""
            ),
            .init(
                firstName: "Vlad",
                lastName: "Katsubo",
                age: 27,
                sex: .male,
                squareAvatarUrl: .none,
                description: ""
            ),
            .init(
                firstName: "Vlad",
                lastName: "Katsubo",
                age: 27,
                sex: .male,
                squareAvatarUrl: .none,
                description: ""
            ),
            .init(
                firstName: "Vlad",
                lastName: "Katsubo",
                age: 27,
                sex: .male,
                squareAvatarUrl: .none,
                description: ""
            )
        ]

        let models: [TwoLineTableViewCell.Model] = users.compactMap({
            .init(
                sex: $0.sex,
                firstName: $0.firstName,
                lastName: $0.lastName,
                age: $0.age,
                avatarImage: UIImage(named: "vladislav_katsubo")
            )
        })

        self.onStateChange?(.onTwoLineTableView(models))
    }
}
