//
//  UserFactory.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 8.07.23.
//

import Foundation

struct UserFactory {

    private enum Constants {
        static let firstNames: [String] = ["Elon", "Bill", "Mark", "Larry", "Jeff", "Steve", "Tim", "Jack", "Sheryl", "Susan"]
        static let lastNames: [String] = ["Musk", "Gates", "Zuckerberg", "Page", "Bezos", "Jobs", "Cook", "Ma", "Sandberg", "Wojcicki"]

        static let descriptions: [String] = [
            "A visionary entrepreneur and leader in the tech industry with groundbreaking ideas.",
            "Highly successful entrepreneur with a track record of founding and scaling successful companies.",
            "Known for their innovation and leadership in the tech sector, constantly pushing boundaries.",
            "A force to be reckoned with in the business world, always one step ahead of the competition.",
            "A self-made billionaire entrepreneur, they have transformed the industry with their disruptive ideas.",
            "With their relentless pursuit of innovation, they have changed the world as we know it.",
            "Their drive for success and innovation has made them one of the most influential people in tech.",
            "An icon of entrepreneurial success, they are known for their strategic thinking and leadership.",
            "Their entrepreneurial journey is an inspiration to many, showcasing resilience and determination.",
            "They have forever changed the landscape of the industry with their innovative approach."
        ]

        static let avatars: [URL?] = [
            URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Mark_Zuckerberg_F8_2019_Keynote_%2832830578717%29_%28cropped%29.jpg/964px-Mark_Zuckerberg_F8_2019_Keynote_%2832830578717%29_%28cropped%29.jpg"
               ),
            URL(string: "https://image.cnbcfm.com/api/v1/image/105773423-1551716977818rtx6p9yw.jpg?v=1551717428&w=700&h=700")
        ]
    }

    static func generateUsers(_ count: Int) -> [User] {
        var mockUsers: [User] = []
        for _ in 0...count {
            let user = User.init(
                firstName: Constants.firstNames.randomElement(),
                lastName: Constants.lastNames.randomElement(),
                age: Int.random(in: 18...99),
                sex: User.Sex.allCases.randomElement(),
                squareAvatarUrl: Constants.avatars.compactMap({$0}).randomElement(),
                description: Constants.descriptions.randomElement()
            )
            mockUsers.append(user)
        }

        return mockUsers
    }
}
