//
//  AppContext.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 20.07.23.
//

import Foundation

struct AppContext {

    let userDefaultsService: UserDefaultsServiceProtocol
    let appDataService: AppDataProtocol

    static func makeContext() -> AppContext {
        let userDefaultsDependencies = UserDefaultsService.Dependencies()
        let userDefaultsService = UserDefaultsService(dependencies: userDefaultsDependencies)

        let appDataDependencies = AppDataService.Dependencies(userDefaultsService: userDefaultsService)
        let appDataService = AppDataService(dependencies: appDataDependencies)

        return AppContext(
            userDefaultsService: userDefaultsService,
            appDataService: appDataService
        )
    }
}
