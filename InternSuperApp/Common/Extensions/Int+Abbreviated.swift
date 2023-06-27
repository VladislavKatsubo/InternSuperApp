//
//  Int+Abbreviated.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 25.06.23.
//

import Foundation

extension Int {
    func abbreviated() -> String {
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        numFormatter.maximumFractionDigits = 1

        let num = abs(self)

        switch num {
        case 1_000_000_000...:
            if let formatted = numFormatter.string(from: NSNumber(value: Double(self)/1_000_000_000)) {
                return formatted + "B"
            } else {
                return String(self)
            }
        case 1_000_000...:
            if let formatted = numFormatter.string(from: NSNumber(value: Double(self)/1_000_000)) {
                return formatted + "M"
            } else {
                return String(self)
            }
        case 1_000...:
            if let formatted = numFormatter.string(from: NSNumber(value: Double(self)/1_000)) {
                return formatted + "K"
            } else {
                return String(self)
            }
        default:
            return numFormatter.string(from: NSNumber(value: self)) ?? String(self)
        }
    }
}
