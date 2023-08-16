//
//  AsimmetricCollectionCell.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 15.08.23.
//

import UIKit

final class AsimmetricCollectionCell: ICollectionCell {

    // MARK: - Configure
    func configure(with model: Model) {
        self.backgroundColor = model.backgroundColor
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = bounds.height / 8.0
    }
}
