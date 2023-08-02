//
//  ITableView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 22.07.23.
//

import UIKit

class ITableView: UITableView {

    init(style: UITableView.Style) {
        super.init(frame: .zero, style: style)
        setupItems()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods
    func registerCells(_ cells: [ITableViewCell.Type]) {
        cells.forEach({ register($0, forCellReuseIdentifier: $0.reuseID) })
    }

    func registerHeadersFooters(_ headersFooters: [ISectionCell.Type]) {
        headersFooters.forEach({ register($0, forHeaderFooterViewReuseIdentifier: $0.reuseID) })
    }
}

private extension ITableView {
    // MARK: - Private methods
    func setupItems() {
        backgroundColor = .clear
    }
}
