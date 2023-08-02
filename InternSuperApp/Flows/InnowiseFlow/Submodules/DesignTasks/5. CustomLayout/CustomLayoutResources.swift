//
//  CustomLayoutResources.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 22.06.23.
//

import UIKit

struct CustomLayoutResources {
    // MARK: - Handlers
    struct Handlers {

    }

    // MARK: - States
    enum State {
        case onCoverView(UIImage?)
        case onTitleLabel(String?)
        case onIconProfileFollowView(IconProfileFollowView.Model)
        case onRecommendationsCountView(RecommendationsCountView.Model)
        case onStatisticView(StatisticsView.Model)
    }

    // MARK: - Constants
    enum Constants {
        enum UI {
            static let coverViewHeightMultiplier: CGFloat = 0.7

            static let titleLabelCustomSpacing: CGFloat = 15.0
            static let iconProfileFollowViewCustomSpacing: CGFloat = 25.0
            static let separatorLineViewCustomSpacing: CGFloat = 5.0
            static let recommendationsCountViewCustomSpacing: CGFloat = 5.0

            static let titleLabelHeight: CGFloat = 80.0

            static let stackViewTopOffset: CGFloat = -40.0
            static let stackViewLeadingOffset: CGFloat = 20.0
            static let stackViewTrailingInset: CGFloat = -20.0
            static let stackViewBottomInset: CGFloat = -20.0

            static let titleLabelFont: UIFont = .systemFont(ofSize: 28.0, weight: .regular)
            static let titleLabelTextColor: UIColor = .white
            static let titleLabelNumberOfLines: Int = 3
        }

        enum Mocks {
            static let coverViewImages: [UIImage?] = (1...10).map { UIImage(named: String($0)) }

            static let titleLabelTexts: [String] = [
                "Winner of the 2023 World Car Awards",
                "Model winner of 2023 New York Fashion Week",
                "2023 Grammy's Best New Artist",
                "2023's Top Chef in Paris",
                "Winner of the 2023 Booker Prize",
                "Best Architect of 2023: Sydney Opera House",
                "2023 World's Best Pastry Chef",
                "Winner of the 2023 London Film Festival",
                "Winner of the 2023 Venice Biennale",
                "2023 Nobel Prize Laureate in Physics"
            ]

            static let profileNames: [String] = [
                "James Miller",
                "Charlotte Anderson",
                "Oliver Harris",
                "Amelia Thompson",
                "Ethan Martinez",
                "Sophia Taylor",
                "Michael Clark",
                "Isabella Roberts",
                "Harry Davis",
                "Ava Hall"
            ].shuffled()

            static let profileIconStackImages: [UIImage?] = (1...10).map { UIImage(named: String($0)) }

            static let iconProfileModels: [IconProfileFollowView.Model] = zip(profileNames, profileIconStackImages).map {
                IconProfileFollowView.Model(
                    name: $0.0,
                    profileImage: $0.1,
                    publishDate: Date().addingTimeInterval(-3600 * 24 * Double.random(in: 0...45))
                )
            }

            static func randomRecommendationsCountViewModel() -> RecommendationsCountView.Model {
                let maxAmount = Int.random(in: 0...99)
                let currentAmount = Int.random(in: 0...maxAmount)
                return .init(
                    maxAmount: maxAmount,
                    currentAmount: currentAmount
                )
            }

            static func randomSymbolTextViewModels() -> [SymbolTextView.Model] {
                return [
                    .init(
                        symbol: UIImage(systemName: "eye.fill")?.withTintColor(.gray).withRenderingMode(.alwaysOriginal),
                        counter: Int.random(in: 0...1500),
                        alignment: .leadingSymbol
                    ),
                    .init(
                        symbol: UIImage(systemName: "message.fill")?.withTintColor(.gray).withRenderingMode(.alwaysOriginal),
                        counter: Int.random(in: 0...1500),
                        alignment: .leadingSymbol
                    ),
                    .init(
                        symbol: UIImage(systemName: "heart.fill")?.withTintColor(.gray).withRenderingMode(.alwaysOriginal),
                        counter: Int.random(in: 0...1500),
                        alignment: .leadingSymbol
                    )
                ]
            }
        }
    }
}
