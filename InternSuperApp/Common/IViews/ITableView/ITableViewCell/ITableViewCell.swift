//
//  ITableViewCell.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 22.07.23.
//

import UIKit

class ITableViewCell: UITableViewCell {

    static var reuseID: String { String(describing: self) }

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        didLoad()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods
    func didLoad() {
        selectionStyle = .none
    }
}