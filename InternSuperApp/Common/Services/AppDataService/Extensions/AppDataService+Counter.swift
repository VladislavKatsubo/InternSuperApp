//
//  AppDataService+Counter.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 16.08.23.
//

import Foundation

public protocol AppCounterProtocol {
    func getCounterValue() -> CGFloat?
    func setCounterValue(with value: CGFloat?)
}

extension AppDataService {
    // MARK: - Constants
    private enum Constants {
        static let counterKey: String = "counter_value"
    }

    // MARK: - Public methods
    public func getCounterValue() -> CGFloat? {
        return dependencies.userDefaultsService.fetchOptional(for: Constants.counterKey)
    }

    public func setCounterValue(with value: CGFloat?) {
        dependencies.userDefaultsService.put(value, for: Constants.counterKey)
    }
}

