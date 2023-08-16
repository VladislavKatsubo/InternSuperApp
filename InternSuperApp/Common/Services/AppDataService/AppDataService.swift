//
//  AppDataService.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 16.08.23.
//

import Foundation

public protocol AppDataHolder {
    var appDataService: AppDataProtocol { get }
}

public typealias AppLifecycleProtocol =
AppCounterProtocol

public typealias AppDataProtocol =
AppLifecycleProtocol

final public class AppDataService: AppDataProtocol {

    // MARK: - Dependencies
    public struct Dependencies {
        let userDefaultsService: UserDefaultsServiceProtocol

        public init(userDefaultsService: UserDefaultsServiceProtocol) {
            self.userDefaultsService = userDefaultsService
        }
    }

    private(set) var dependencies: Dependencies

    // MARK: - Initializator
    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    // MARK: - Public methods
}

