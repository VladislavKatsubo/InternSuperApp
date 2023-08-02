//
//  ISectionCell.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 22.07.23.
//

import UIKit

class ISectionCell: UITableViewHeaderFooterView {

    static var reuseID: String { String(describing: self) }

    // MARK: - Initi
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        didLoad()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemeted")
    }

    // MARK: - Public methods
    func didLoad() {

    }
}
