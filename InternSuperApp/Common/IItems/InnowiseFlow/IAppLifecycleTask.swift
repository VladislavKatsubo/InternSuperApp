//
//  IAppLifecycleTask.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 16.08.23.
//

enum IAppLifecycleTask: InnowiseTaskProtocol, Equatable, CaseIterable {

    case countViewTask

    var title: String {
        switch self {

        case .countViewTask: return "CounterView"
        }
    }
}

