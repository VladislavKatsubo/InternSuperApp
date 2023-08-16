//
//  InnowiseTasksViewModel.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 23.07.23.
//


import Foundation

protocol InnowiseTasksViewModelProtocol {
    var onStateChange: ((InnowiseTasksResources.State) -> Void)? { get set }

    func launch()
    func didTap(at taskSection: InnowiseTaskProtocol)
}

final class InnowiseTasksViewModel: InnowiseTasksViewModelProtocol {

    typealias Constants = InnowiseTasksResources.Constants.Mocks

    private let context: AppContext
    private let designHandlers: InnowiseTasksResources.Handlers.Design
    private let listHandlers: InnowiseTasksResources.Handlers.Lists

    var onStateChange: ((InnowiseTasksResources.State) -> Void)?

    // MARK: - Init
    init(context: AppContext,
         designHandlers: InnowiseTasksResources.Handlers.Design,
         listHandlers: InnowiseTasksResources.Handlers.Lists
    ) {
        self.context = context
        self.designHandlers = designHandlers
        self.listHandlers = listHandlers
    }

    // MARK: - Public methods
    func launch() {
        setupModels()
    }

    func didTap(at task: InnowiseTaskProtocol) {
        switch task as? IDesignTask {
        case .centeringElements: return self.designHandlers.onCenteringElements()
        case .scrollViewWithPinnedButton: return self.designHandlers.onScrollView()
        case .horizontalStackViewRelativeSizes: return self.designHandlers.onHorizontalStackViewRelativeSizes()
        case .eyedropper: return self.designHandlers.onEyeDropper()
        case .customLayout: return self.designHandlers.onCustomLayout()
        case .dynamicUIChanges: return self.designHandlers.onDynamicUIChanges()
        case .compoundView: return self.designHandlers.onCompoundView()
        case .circularProgressBar: return self.designHandlers.onCircularProgressBar()
        case .none: break
        }
        switch task as? IListTask {
        case .initialTask: self.listHandlers.onTabBarController()
        case .none: break
        }
    }
}

private extension InnowiseTasksViewModel {
    // MARK: - Private methods
    func setupModels() {
        setupTaskSectionsTableView()
    }

    func setupTaskSectionsTableView() {
        let sectionsWithTasks: [IInnowiseTaskSection] = [
            .designSection(tasks: IDesignTask.allCases),
            .listsSection(tasks: IListTask.allCases)
        ]
        onStateChange?(.onTaskSectionsTableView(sectionsWithTasks))
    }
}
