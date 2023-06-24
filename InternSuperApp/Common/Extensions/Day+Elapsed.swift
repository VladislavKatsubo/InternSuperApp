//
//  Day+Elapsed.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 23.06.23.
//

import Foundation

extension Date {
    func daysElapsed() -> String {
        let calendar = Calendar.current
        let now = Date()
        let components = calendar.dateComponents([.day], from: self, to: now)

        guard let day = components.day else {
            return "Invalid date"
        }

        switch day {
        case 0:
            return "Today"
        case 1...30:
            return "\(day) Days Ago"
        default:
            return "30+ Days Ago"
        }
    }
}
