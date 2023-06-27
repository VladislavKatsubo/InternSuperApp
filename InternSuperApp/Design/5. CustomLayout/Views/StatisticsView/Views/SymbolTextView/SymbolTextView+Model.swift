//
//  SymbolTextView+Model.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 26.06.23.
//

import UIKit

extension SymbolTextView {
    struct Model {
        let symbol: UIImage?
        let counter: Int?
        let alignment: SymbolAlignment

        enum SymbolAlignment {
            case leadingSymbol
            case trailingSymbol
        }
    }
}
