//
//  ServiceFactory.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 17.08.23.
//

import Foundation

class ServiceFactory {
    static func createNetworkManager() -> NetworkManagerProtocol {
        let urlSession = URLSession(configuration: .default)
        return NetworkManager(session: urlSession)
    }

    static func createImageManager() -> ImageManagerProtocol {
        let networkManager = createNetworkManager()
        return ImageManager(networkManager: networkManager)
    }
}
