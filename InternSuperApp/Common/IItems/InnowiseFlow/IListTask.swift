//
//  IListTask.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 27.07.23.
//

enum IListTask: InnowiseTaskProtocol, Equatable, CaseIterable {

    case initialTask

    var title: String {
        switch self {
            
        case .initialTask: return "TabBarController w/ Lists"
        }
    }
}
