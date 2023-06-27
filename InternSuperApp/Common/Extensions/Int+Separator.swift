//
//  Int+Separator.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 25.06.23.
//

import Foundation

extension Int {
    var formattedWithSeparator: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = .current
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
