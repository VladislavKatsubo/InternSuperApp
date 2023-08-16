//
//  AppContext.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 20.07.23.
//

import Foundation

struct AppContext {

    let networkManager: NetworkManagerProtocol
    let imageManager: ImageManagerProtocol
    let userDefaultsService: UserDefaultsServiceProtocol
    let appDataService: AppDataProtocol

    static func makeContext() -> AppContext {
        let urlSession = URLSession(configuration: .default)
        let networkManager = NetworkManager(session: urlSession)
        let imageManager = ImageManager(networkManager: networkManager)

        let userDefaultsDependencies = UserDefaultsService.Dependencies()
        let userDefaultsService = UserDefaultsService(dependencies: userDefaultsDependencies)

        let appDataDependencies = AppDataService.Dependencies(userDefaultsService: userDefaultsService)
        let appDataService = AppDataService(dependencies: appDataDependencies)

        return AppContext(
            networkManager: networkManager,
            imageManager: imageManager,
            userDefaultsService: userDefaultsService,
            appDataService: appDataService
        )
    }
}
