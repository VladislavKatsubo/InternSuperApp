//
//  IListTask.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 27.07.23.
//

enum IListTask: InnowiseTaskProtocol, Equatable, CaseIterable {

    case tabBarTask

    var title: String {
        switch self {
            
        case .tabBarTask: return "TabBarController w/ Lists"
        }
    }
}
