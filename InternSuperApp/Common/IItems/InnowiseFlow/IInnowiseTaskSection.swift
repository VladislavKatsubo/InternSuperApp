//
//  IInnowiseTaskSection.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 23.07.23.
//

enum IInnowiseTaskSection: Equatable, CaseIterable {

    case designSection(tasks: [IDesignTask])
    case listsSection(tasks: [IListTask])
    case appLifecycleTask(tasks: [IAppLifecycleTask])

    var title: String {
        switch self {
        case .designSection: return "Работа с Design"
        case .listsSection: return "Работа со списками"
        case .appLifecycleTask: return "Жизненный цикл UIApplication"
        }
    }

    var tasks: [InnowiseTaskProtocol] {
        switch self {
        case .designSection(let tasks): return tasks
        case .listsSection(let tasks): return tasks
        case .appLifecycleTask(let tasks): return tasks
        }
    }
    
    static var allCases: [IInnowiseTaskSection] {
        return [
            .designSection(tasks: IDesignTask.allCases),
            .listsSection(tasks: IListTask.allCases),
            .appLifecycleTask(tasks: IAppLifecycleTask.allCases)
        ]
    }
}
