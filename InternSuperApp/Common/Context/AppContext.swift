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

    static func makeContext() -> AppContext {
        let urlSession = URLSession(configuration: .default)
        let networkManager = NetworkManager(session: urlSession)
        let imageManager = ImageManager(networkManager: networkManager)

        return AppContext(
            networkManager: networkManager,
            imageManager: imageManager
        )
    }
}
